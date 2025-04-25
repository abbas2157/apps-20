import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tips_provider.dart';
import '../providers/bookmarks_provider.dart';
import '../widgets/tip_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookmarks'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer2<BookmarksProvider, TipsProvider>(
        builder: (context, bookmarksProvider, tipsProvider, child) {
          final bookmarkedTipIds = bookmarksProvider.bookmarkedTipIds;
          
          if (bookmarkedTipIds.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.bookmark_border,
                      size: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No bookmarks yet',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Save your favorite eco tips by tapping the bookmark icon',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate back to home or categories
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    icon: const Icon(Icons.search),
                    label: const Text('Explore Tips'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // Get the bookmarked tips
          final bookmarkedTips = bookmarkedTipIds
              .map((id) => tipsProvider.getTipById(id))
              .where((tip) => tip != null)
              .toList();

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bookmark,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bookmarkedTips.length} Saved Tips',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          'Your collection of favorite eco tips',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: bookmarkedTips.length,
                  itemBuilder: (context, index) {
                    return TipCard(tip: bookmarkedTips[index]!);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}