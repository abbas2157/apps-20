// splash_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Load data and navigate to home screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo (First Aid Cross)
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.health_and_safety,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            // App Name
            Text(
              'QuickFirstAid',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            // Tagline
            Text(
              'Emergency help at your fingertips',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}