import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  double textSize = 1.0;
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Display Settings
          const ListTile(
            title: Text(
              'Display Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Change app appearance'),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
          ListTile(
            title: const Text('Text Size'),
            subtitle: const Text('Adjust text visibility'),
            trailing: SizedBox(
              width: 150,
              child: Slider(
                value: textSize,
                min: 0.8,
                max: 1.4,
                divisions: 6,
                label: textSize.toStringAsFixed(1) + 'x',
                onChanged: (value) {
                  setState(() {
                    textSize = value;
                  });
                },
              ),
            ),
          ),

          const Divider(),

          // Region & Language
          const ListTile(
            title: Text(
              'Region & Language',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Emergency Contact Numbers'),
            subtitle: const Text('Set your local emergency number'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to emergency contact settings
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(language),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Show language selection dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select Language'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('English'),
                          onTap: () {
                            setState(() {
                              language = 'English';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Spanish'),
                          onTap: () {
                            setState(() {
                              language = 'Spanish';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('French'),
                          onTap: () {
                            setState(() {
                              language = 'French';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text('Urdu'),
                          onTap: () {
                            setState(() {
                              language = 'Urdu';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          const Divider(),

          // App Info
          const ListTile(
            title: Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('About QuickFirstAid'),
            subtitle: const Text('Version 1.0.0'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Show app info
            },
          ),
          ListTile(
            title: const Text('Send Feedback'),
            subtitle: const Text('Help us improve the app'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to feedback form
            },
          ),
        ],
      ),
    );
  }
}