import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookmarksProvider with ChangeNotifier {
  List<String> _bookmarkedTipIds = [];
  List<String> get bookmarkedTipIds => _bookmarkedTipIds;

  BookmarksProvider() {
    _loadBookmarksFromPrefs();
  }

  bool isBookmarked(String tipId) {
    return _bookmarkedTipIds.contains(tipId);
  }

  void toggleBookmark(String tipId) {
    if (_bookmarkedTipIds.contains(tipId)) {
      _bookmarkedTipIds.remove(tipId);
    } else {
      _bookmarkedTipIds.add(tipId);
    }
    _saveBookmarksToPrefs();
    notifyListeners();
  }

  Future<void> _loadBookmarksFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarksString = prefs.getString('bookmarks') ?? '[]';
    _bookmarkedTipIds = List<String>.from(jsonDecode(bookmarksString));
    notifyListeners();
  }

  Future<void> _saveBookmarksToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('bookmarks', jsonEncode(_bookmarkedTipIds));
  }
}