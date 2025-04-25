import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tips_provider.dart';
import '../widgets/tip_card.dart';

class CategoryTipsScreen extends StatelessWidget {
  final String categoryId;
  
  const CategoryTipsScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tipsProvider = Provider.of<TipsProvider>(context);
    final category = tipsProvider.getCategoryById(categoryId);
    final tips = tipsProvider.getTipsByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? 'Category'),
        centerTitle: true,
      ),
      body: tips.isEmpty
          ? const Center(
              child: Text('No tips available for this category'),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: tips.length,
              itemBuilder: (context, index) {
                return TipCard(tip: tips[index]);
              },
            ),
    );
  }
}