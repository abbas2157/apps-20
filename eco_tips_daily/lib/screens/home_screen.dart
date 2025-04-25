import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tips_provider.dart';
import '../models/tip.dart';
import '../widgets/tip_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TipsProvider>(
        builder: (context, tipsProvider, child) {
          if (tipsProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final dailyTip = tipsProvider.getDailyTip();
          
          return CustomScrollView(
            slivers: [
              // Custom app bar with fancy design
              SliverAppBar(
                expandedHeight: 180.0,
                floating: false,
                pinned: true,
                backgroundColor: Theme.of(context).primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Eco Tips Daily',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          dailyTip.imageUrl.isNotEmpty
                              ? dailyTip.imageUrl
                              : 'assets/images/nature_bg.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              child: const Center(
                                child: Icon(
                                  Icons.eco,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Theme.of(context).primaryColor.withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Daily tip section with header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.tips_and_updates,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Today\'s Eco Tip',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Daily tip card
              SliverToBoxAdapter(
                child: TipCard(tip: dailyTip),
              ),
              
              // More tips section header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.eco,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'More Tips',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // More tips list
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final otherTips = getOtherTips(tipsProvider.tips, dailyTip.id, 5);
                    if (index >= otherTips.length) return null;
                    return TipCard(tip: otherTips[index]);
                  },
                  childCount: 5, // Show 5 more tips
                ),
              ),
              
              // Bottom padding
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
            ],
          );
        },
      ),
    );
  }

  // Get additional tips for the home screen
  List<Tip> getOtherTips(List<Tip> allTips, String excludeTipId, int count) {
    final otherTips = allTips.where((tip) => tip.id != excludeTipId).toList();
    otherTips.shuffle();
    return otherTips.take(count).toList();
  }
}