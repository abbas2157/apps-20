// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

// Import models
import 'models/procedure.dart';

// Import providers
import 'providers/first_aid_data_provider.dart';

// Import screens
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/category_screen.dart';
import 'screens/procedure_detail_screen.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/settings_screen.dart';

// Import widgets
import 'widgets/emergency_call_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => FirstAidDataProvider(),
      child: const QuickFirstAidApp(),
    ),
  );
}

// App Theme and Main Widget
class QuickFirstAidApp extends StatelessWidget {
  const QuickFirstAidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickFirstAid',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          primary: Colors.red,
          secondary: Colors.redAccent,
          error: Colors.red[900]!,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 15),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}