import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/tip.dart';
import '../models/category.dart';

class TipsProvider with ChangeNotifier {
  List<Tip> _tips = [];
  List<Category> _categories = [];
  bool _isLoading = true;

  List<Tip> get tips => _tips;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  TipsProvider() {
    loadTips();
  }

  Future<void> loadTips() async {
    try {
      // Load the JSON file from the assets
      final String response = await rootBundle.loadString('assets/data/tips.json');
      final data = json.decode(response);
      
      // Parse categories
      _categories = (data['categories'] as List)
          .map((categoryJson) => Category.fromJson(categoryJson))
          .toList();
      
      // Parse tips
      _tips = (data['tips'] as List)
          .map((tipJson) => Tip.fromJson(tipJson))
          .toList();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error loading tips: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get a random tip for the daily tip feature
  Tip getDailyTip() {
    if (_tips.isEmpty) {
      return Tip(
        id: 'default',
        title: 'No tips available',
        content: 'Please check back later',
        categoryId: '',
      );
    }
    
    // Use the current date to create a consistent "random" tip for the day
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    final tipIndex = dayOfYear % _tips.length;
    
    return _tips[tipIndex];
  }

  // Get tips by category
  List<Tip> getTipsByCategory(String categoryId) {
    return _tips.where((tip) => tip.categoryId == categoryId).toList();
  }

  // Get a tip by ID
  Tip? getTipById(String id) {
    try {
      return _tips.firstWhere((tip) => tip.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get a category by ID
  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }
}