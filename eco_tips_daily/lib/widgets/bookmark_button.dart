import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bookmarks_provider.dart';

class BookmarkButton extends StatelessWidget {
  final String tipId;
  final bool isBookmarked;

  const BookmarkButton({
    Key? key,
    required this.tipId,
    required this.isBookmarked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked ? Theme.of(context).primaryColor : null,
      ),
      onPressed: () {
        final bookmarksProvider =
            Provider.of<BookmarksProvider>(context, listen: false);
        bookmarksProvider.toggleBookmark(tipId);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isBookmarked
                  ? 'Removed from bookmarks'
                  : 'Added to bookmarks',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
    );
  }
}