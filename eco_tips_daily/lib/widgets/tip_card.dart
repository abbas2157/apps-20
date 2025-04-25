import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bookmarks_provider.dart';
import '../models/tip.dart';
import '../screens/tip_details_screen.dart';
import 'bookmark_button.dart';

class TipCard extends StatelessWidget {
  final Tip tip;
  final bool showBookmark;

  const TipCard({
    Key? key,
    required this.tip,
    this.showBookmark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookmarksProvider = Provider.of<BookmarksProvider>(context);
    final isBookmarked = bookmarksProvider.isBookmarked(tip.id);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TipDetailsScreen(tipId: tip.id),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tip.imageUrl.isNotEmpty)
              Stack(
                children: [
                  Image.asset(
                    tip.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.eco,
                          color: Theme.of(context).primaryColor,
                          size: 60,
                        ),
                      );
                    },
                  ),
                  if (showBookmark)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: BookmarkButton(
                          tipId: tip.id,
                          isBookmarked: isBookmarked,
                        ),
                      ),
                    ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          tip.title,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (showBookmark && tip.imageUrl.isEmpty)
                        BookmarkButton(
                          tipId: tip.id,
                          isBookmarked: isBookmarked,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tip.content.length > 120
                        ? '${tip.content.substring(0, 120)}...'
                        : tip.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TipDetailsScreen(tipId: tip.id),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Read More'),
                        style: TextButton.styleFrom(
                          foregroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}