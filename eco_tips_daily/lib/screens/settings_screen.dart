import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Theme settings
          _buildSectionHeader(context, 'Appearance'),
          _buildThemeSetting(context),
          
          const Divider(height: 40),
          
          // App info
          _buildSectionHeader(context, 'About'),
          _buildInfoTile(
            context,
            'App Version',
            '1.0.0',
            Icons.info_outline,
          ),
          _buildInfoTile(
            context,
            'Made with',
            'Flutter',
            Icons.favorite,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildThemeSetting(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return SwitchListTile(
      title: const Text('Dark Mode'),
      subtitle: const Text('Toggle between light and dark theme'),
      secondary: Icon(
        themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: themeProvider.isDarkMode ? AppTheme.accentColor : AppTheme.primaryColor,
      ),
      value: themeProvider.isDarkMode,
      onChanged: (_) => themeProvider.toggleTheme(),
      activeColor: AppTheme.primaryColor,
    );
  }
  
  Widget _buildInfoTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    Color? color,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? AppTheme.primaryColor,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}