// screens/home_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../models/question.dart';
import 'quiz_screen.dart';
import '../widgets/mode_info_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Method to show mode info dialog
  Future<void> _showModeInfo(BuildContext context, Difficulty difficulty) async {
    final bool? startQuiz = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return ModeInfoModal(difficulty: difficulty);
      },
    );
    
    // If user pressed Start Quiz button
    if (startQuiz == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(difficulty: difficulty),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              
              // Logo and app name container
              Center(
                child: Column(
                  children: [
                    // Animated sparkles effect
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Main logo text
                        Image.asset(
                          'assets/images/logo.png',
                          width: 180,
                          height: 80,
                        ),
                        
                        // Sparkle icon in top right
                        Positioned(
                          top: 5,
                          right: 40,
                          child: Icon(
                            Icons.auto_awesome,
                            color: AppTheme.brightCyan,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    
                    // Tagline
                    Text(
                      'Learn English the Easy Way',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Illustrated character or icon
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.school,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              
              const Spacer(),
              
              // Mode selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Basic mode button
                    AppTheme.gradientButton(
                      text: 'Start Basic Mode',
                      onPressed: () => _showModeInfo(context, Difficulty.basic),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Intermediate mode button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () => _showModeInfo(context, Difficulty.intermediate),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Start Intermediate Mode',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Advanced mode button
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.hotPink.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => _showModeInfo(context, Difficulty.advanced),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.hotPink.withOpacity(0.8),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Start Advanced Mode',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}