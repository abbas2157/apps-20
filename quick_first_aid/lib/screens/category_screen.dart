// category_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/first_aid_data_provider.dart';
import 'procedure_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final String categoryId;

  const CategoryScreen({
    Key? key,
    required this.title,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<FirstAidDataProvider>(context);
    final procedures = dataProvider.getProceduresByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Category bookmarked')),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _getCategoryDescription(categoryId),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          // List of procedures
          Expanded(
            child: procedures.isEmpty
                ? const Center(child: Text('No procedures available'))
                : ListView.separated(
              itemCount: procedures.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final procedure = procedures[index];
                return ListTile(
                  title: Text(procedure.title),
                  subtitle: Text(
                    _getUrgencyText(procedure.urgencyLevel),
                  ),
                  leading: _getUrgencyIndicator(procedure.urgencyLevel),
                  trailing: const Icon(Icons.chevron_right),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProcedureDetailScreen(
                          procedureId: procedure.id,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryDescription(String categoryId) {
    // These would come from a proper data source
    switch (categoryId) {
      case 'cpr_resuscitation':
        return 'Learn how to perform life-saving cardiopulmonary resuscitation (CPR) for different age groups.';
      case 'choking_airway':
        return 'Procedures to help someone who is choking or having difficulty breathing.';
      case 'bleeding_wounds':
        return 'Techniques to control bleeding and treat various types of wounds.';
      case 'burns_scalds':
        return 'How to treat different types of burns, from minor to severe.';
      case 'fractures_sprains':
        return 'First aid for broken bones, sprains, and dislocations.';
      case 'bites_stings':
        return 'Treatment for insect stings, animal bites, and marine creature injuries.';
      case 'allergic_reactions':
        return 'Recognize and treat allergic reactions, including anaphylaxis.';
      case 'heat_cold_injuries':
        return 'Dealing with heat exhaustion, heat stroke, hypothermia, and frostbite.';
      default:
        return 'Learn about important first aid procedures in this category.';
    }
  }

  String _getUrgencyText(String urgencyLevel) {
    switch (urgencyLevel) {
      case 'critical':
        return 'Critical - Immediate action required';
      case 'moderate':
        return 'Moderate - Prompt attention needed';
      case 'low':
        return 'Low - Non-urgent care';
      default:
        return 'Standard procedure';
    }
  }

  Widget _getUrgencyIndicator(String urgencyLevel) {
    Color color;
    IconData icon;

    switch (urgencyLevel) {
      case 'critical':
        color = Colors.red;
        icon = Icons.priority_high;
        break;
      case 'moderate':
        color = Colors.orange;
        icon = Icons.warning;
        break;
      case 'low':
        color = Colors.green;
        icon = Icons.info;
        break;
      default:
        color = Colors.blue;
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}