// screens/result_screen.dart
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'dart:math' as math;

class ResultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;
  final Difficulty difficulty;
  
  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scoreAnimation;
  late Animation<double> _opacityAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    // Animations
    _scoreAnimation = Tween<double>(begin: 0, end: widget.score.toDouble())
      .animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.75, curve: Curves.easeOut),
      ));
    
    _opacityAnimation = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ));
    
    // Start the animation
    _controller.forward();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Calculate percentage
    final percentage = (widget.score / widget.totalQuestions) * 100;
    
    // Determine feedback based on score
    String feedback;
    Color feedbackColor;
    IconData feedbackIcon;
    
    if (percentage >= 80) {
      feedback = "Excellent! You're doing great!";
      feedbackColor = AppTheme.correctColor;
      feedbackIcon = Icons.emoji_events;
    } else if (percentage >= 60) {
      feedback = "Good job! Keep practicing!";
      feedbackColor = AppTheme.brightCyan;
      feedbackIcon = Icons.thumb_up;
    } else {
      feedback = "Keep learning! You'll improve soon!";
      feedbackColor = AppTheme.hotPink;
      feedbackIcon = Icons.workspace_premium;
    }
    
    // Mode-specific message
    String modeMessage;
    
    // Determine message based on difficulty
    switch (widget.difficulty) {
      case Difficulty.basic:
        modeMessage = "You've completed the Basic Mode. Ready for Intermediate?";
        break;
      case Difficulty.intermediate:
        modeMessage = "You've completed the Intermediate Mode. Well done!";
        break;
      case Difficulty.advanced:
        modeMessage = "You've mastered the Advanced Mode. Impressive!";
        break;
      default:
        modeMessage = "Quiz complete!";
    }
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // Confetti animation and title
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Main title
                    ShaderMask(
                      shaderCallback: (bounds) => AppTheme.purpleToCyanGradient.createShader(bounds),
                      child: Text(
                        'Quiz Complete!',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                    // Confetti icons
                    Positioned(
                      top: 0,
                      right: 40,
                      child: Icon(
                        Icons.celebration,
                        color: AppTheme.hotPink,
                        size: 24,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 50,
                      child: Icon(
                        Icons.auto_awesome,
                        color: AppTheme.brightCyan,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Score Circle with Animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        // Circular progress indicator
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: CircularProgressIndicator(
                            value: _scoreAnimation.value / widget.totalQuestions,
                            strokeWidth: 12,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              percentage >= 80 
                                ? AppTheme.correctColor 
                                : (percentage >= 60 
                                    ? AppTheme.brightCyan 
                                    : AppTheme.hotPink),
                            ),
                          ),
                        ),
                        
                        // Animated score display
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${_scoreAnimation.value.toInt()}',
                              style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '/${widget.totalQuestions}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '${(percentage * _scoreAnimation.value / widget.score).toInt()}%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                
                const SizedBox(height: 40),
                
                // Feedback with animation
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: Column(
                    children: [
                      // Feedback icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: feedbackColor.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          feedbackIcon,
                          color: feedbackColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Feedback text
                      Text(
                        feedback,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      
                      // Mode message
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          modeMessage,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Try Again Button - Gradient style
                      AppTheme.gradientButton(
                        text: 'Try Again',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => QuizScreen(difficulty: widget.difficulty)),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Home Button - Outlined style
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
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
                            'Go to Home',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}