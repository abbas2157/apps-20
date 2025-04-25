import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tips_provider.dart';
import '../providers/bookmarks_provider.dart';
import '../widgets/bookmark_button.dart';

class TipDetailsScreen extends StatelessWidget {
  final String tipId;
  
  const TipDetailsScreen({
    Key? key,
    required this.tipId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tipsProvider = Provider.of<TipsProvider>(context);
    final bookmarksProvider = Provider.of<BookmarksProvider>(context);
    final tip = tipsProvider.getTipById(tipId);
    final isBookmarked = bookmarksProvider.isBookmarked(tipId);
    
    if (tip == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Details'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Tip not found'),
        ),
      );
    }

    final category = tipsProvider.getCategoryById(tip.categoryId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco Tip'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: BookmarkButton(
              tipId: tipId,
              isBookmarked: isBookmarked,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (tip.imageUrl.isNotEmpty)
              Stack(
                children: [
                  Image.asset(
                    tip.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        width: double.infinity,
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.eco,
                          color: Theme.of(context).primaryColor,
                          size: 80,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16.0),
                      child: Text(
                        tip.title,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
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
                  if (tip.imageUrl.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        tip.title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          getIconData(category?.icon ?? ''),
                          size: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          category?.name ?? 'Unknown',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    tip.content,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        "Did you know?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    generateDidYouKnow(tip.categoryId),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
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
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      ),
                      label: Text(
                        isBookmarked ? 'Remove from Bookmarks' : 'Add to Bookmarks',
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData getIconData(String iconName) {
    switch (iconName) {
      case 'home':
        return Icons.home;
      case 'business':
        return Icons.business;
      case 'directions_car':
        return Icons.directions_car;
      case 'restaurant':
        return Icons.restaurant;
      case 'yard':
        return Icons.yard;
      case 'bolt':
        return Icons.bolt;
      case 'water_drop':
        return Icons.water_drop;
      case 'delete':
        return Icons.delete;
      default:
        return Icons.eco;
    }
  }

  String generateDidYouKnow(String categoryId) {
    switch (categoryId) {
      case 'home':
        return "The average household can save up to \$150 per year by simply unplugging electronics when not in use.";
      case 'office':
        return "About 45% of paper printed in offices ends up in the trash the same day it was printed.";
      case 'travel':
        return "If every American commuter rode a bike to work just one day a week, we would reduce carbon emissions by over 5 million tons annually.";
      case 'food':
        return "Food typically travels an average of 1,500 miles from farm to plate in the United States.";
      case 'garden':
        return "Native plants can reduce water usage in landscapes by 50-75% compared to conventional gardening.";
      case 'energy':
        return "LED bulbs use up to 85% less energy than traditional incandescent bulbs and can last 25 times longer.";
      case 'water':
        return "The average person can save up to 200 gallons of water per month by simply turning off the tap while brushing their teeth.";
      case 'waste':
        return "The average American produces about 4.5 pounds of trash per day, with only about 1.5 pounds being recycled.";
      default:
        return "Every small eco-friendly action adds up to make a significant positive impact on our planet.";
    }
  }
}