// bookmarks_screen.dart
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: const Center(
        child: Text('Your bookmarked procedures will appear here'),
      ),
    );
  }
}