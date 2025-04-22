// home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/first_aid_data_provider.dart';
import '../widgets/emergency_call_button.dart';
import 'category_screen.dart';
import 'bookmarks_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickFirstAid'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search coming soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fast access to life-saving procedures',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildCategoryCard(
                      context,
                      'CPR & Resuscitation',
                      Icons.favorite,
                      Colors.red[300]!,
                      'cpr_resuscitation',
                    ),
                    _buildCategoryCard(
                      context,
                      'Choking & Airway',
                      Icons.air,
                      Colors.blue[300]!,
                      'choking_airway',
                    ),
                    _buildCategoryCard(
                      context,
                      'Bleeding & Wounds',
                      Icons.water_drop,
                      Colors.red[700]!,
                      'bleeding_wounds',
                    ),
                    _buildCategoryCard(
                      context,
                      'Burns & Scalds',
                      Icons.whatshot,
                      Colors.orange[400]!,
                      'burns_scalds',
                    ),
                    _buildCategoryCard(
                      context,
                      'Fractures & Sprains',
                      Icons.medical_services,
                      Colors.purple[300]!,
                      'fractures_sprains',
                    ),
                    _buildCategoryCard(
                      context,
                      'Bites & Stings',
                      Icons.pest_control,
                      Colors.green[400]!,
                      'bites_stings',
                    ),
                    _buildCategoryCard(
                      context,
                      'Allergic Reactions',
                      Icons.dangerous,
                      Colors.amber[700]!,
                      'allergic_reactions',
                    ),
                    _buildCategoryCard(
                      context,
                      'Heat & Cold Injuries',
                      Icons.thermostat,
                      Colors.blue[700]!,
                      'heat_cold_injuries',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const EmergencyCallButton(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookmarksScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon,
      Color color, String categoryId) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              title: title,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: color,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}