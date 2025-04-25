import 'package:flutter/material.dart';
import '../models/category.dart';
import '../utils/constants.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryListItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  getIconData(category.icon),
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      getCategoryDescription(category.id),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
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

  String getCategoryDescription(String categoryId) {
    switch (categoryId) {
      case 'home':
        return 'Tips for a greener household';
      case 'office':
        return 'Sustainable workplace practices';
      case 'travel':
        return 'Eco-friendly transportation';
      case 'food':
        return 'Sustainable eating habits';
      case 'garden':
        return 'Earth-friendly gardening';
      case 'energy':
        return 'Reduce energy consumption';
      case 'water':
        return 'Water conservation methods';
      case 'waste':
        return 'Minimize and manage waste';
      default:
        return 'Tips for sustainable living';
    }
  }
}