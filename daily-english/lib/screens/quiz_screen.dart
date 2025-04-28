// screens/quiz_screen.dart
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../data/question_data.dart';
import '../utils/app_theme.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Difficulty difficulty;
  
  const QuizScreen({
    Key? key,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  late List<EnhancedQuestion> _questions;
  late List<EnhancedQuestion> _randomizedQuestions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  int? _selectedAnswerIndex;
  bool _isCorrect = false;
  bool _showExplanation = false;
  
  // Animation controller for question transitions
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _randomizeQuestions();
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    
    _animationController.forward();
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  void _loadQuestions() {
    _questions = QuestionData.getQuestionsByDifficulty(widget.difficulty);
  }

  void _randomizeQuestions() {
    // Create a copy of questions to randomize
    _randomizedQuestions = List.from(_questions);
    _randomizedQuestions.shuffle(Random());
  }

  void _checkAnswer(int selectedIndex) {
    if (_hasAnswered) return; // Prevent multiple answers

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _hasAnswered = true;
      
      // Check if answer is correct
      if (selectedIndex == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex) {
        _score++;
        _isCorrect = true;
      } else {
        _isCorrect = false;
      }
      
      // Show explanation if available
      if (_randomizedQuestions[_currentQuestionIndex].explanation != null) {
        _showExplanation = true;
      }
    });
  }

  void _nextQuestion() {
    // Start exit animation
    _animationController.reverse().then((_) {
      setState(() {
        // Move to the next question or finish quiz
        if (_currentQuestionIndex < _randomizedQuestions.length - 1) {
          _currentQuestionIndex++;
          _hasAnswered = false;
          _selectedAnswerIndex = null;
          _showExplanation = false;
          
          // Start entrance animation for next question
          _animationController.forward();
        } else {
          // Quiz finished, show result screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                score: _score,
                totalQuestions: _randomizedQuestions.length,
                difficulty: widget.difficulty,
              ),
            ),
          );
        }
      });
    });
  }

  String _getDifficultyName() {
    switch (widget.difficulty) {
      case Difficulty.basic:
        return 'Basic';
      case Difficulty.intermediate:
        return 'Intermediate';
      case Difficulty.advanced:
        return 'Advanced';
      default:
        return 'Basic';
    }
  }
  
  // Convert category enum to icon
  IconData _getCategoryIcon(QuestionCategory category) {
    switch (category) {
      case QuestionCategory.vocabulary:
        return Icons.menu_book;
      case QuestionCategory.grammar:
        return Icons.edit;
      case QuestionCategory.pronunciation:
        return Icons.record_voice_over;
      case QuestionCategory.conversation:
        return Icons.chat_bubble;
      case QuestionCategory.idioms:
        return Icons.psychology;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Lexi - ${_getDifficultyName()} Mode',
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
          
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Progress and score row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Progress indicator
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Question ${_currentQuestionIndex + 1}/${_randomizedQuestions.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Progress bar
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: (_currentQuestionIndex + 1) / _randomizedQuestions.length,
                              backgroundColor: Colors.white.withOpacity(0.2),
                              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.brightCyan),
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Score indicator
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Score: $_score',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Category chip
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryPurple.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _getCategoryIcon(_randomizedQuestions[_currentQuestionIndex].category),
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _randomizedQuestions[_currentQuestionIndex].category.toString().split('.').last,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Question Card with Animation
                Expanded(
                  child: FadeTransition(
                    opacity: _animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(_animation),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _randomizedQuestions[_currentQuestionIndex].questionText,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.navyBlue,
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Answer Options
                            Expanded(
                              child: ListView(
                                children: _randomizedQuestions[_currentQuestionIndex].options.asMap().entries.map((entry) {
                                  int idx = entry.key;
                                  String option = entry.value;
                                  
                                  // Determine button appearance based on state
                                  Color bgColor;
                                  Color borderColor = Colors.transparent;
                                  Color textColor = AppTheme.navyBlue;
                                  IconData? trailingIcon;
                                  
                                  if (_hasAnswered) {
                                    if (idx == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex) {
                                      bgColor = AppTheme.correctBgColor;
                                      textColor = AppTheme.correctColor;
                                      borderColor = AppTheme.correctColor;
                                      trailingIcon = Icons.check_circle;
                                    } else if (idx == _selectedAnswerIndex) {
                                      bgColor = AppTheme.incorrectBgColor;
                                      textColor = AppTheme.incorrectColor;
                                      borderColor = AppTheme.incorrectColor;
                                      trailingIcon = Icons.cancel;
                                    } else {
                                      bgColor = Colors.grey.shade100;
                                    }
                                  } else {
                                    bgColor = Colors.grey.shade50;
                                  }
                                  
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                      color: bgColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: borderColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: _hasAnswered ? null : () => _checkAnswer(idx),
                                      borderRadius: BorderRadius.circular(12),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                        child: Row(
                                          children: [
                                            // Option letter
                                            Container(
                                              width: 32,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color: _hasAnswered 
                                                    ? (idx == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex 
                                                        ? AppTheme.correctColor 
                                                        : (idx == _selectedAnswerIndex 
                                                            ? AppTheme.incorrectColor 
                                                            : Colors.grey.shade300))
                                                    : AppTheme.primaryPurple.withOpacity(0.1),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  String.fromCharCode(65 + idx), // A, B, C, D
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: _hasAnswered 
                                                        ? (idx == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex 
                                                            || idx == _selectedAnswerIndex ? Colors.white : AppTheme.navyBlue)
                                                        : AppTheme.primaryPurple,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            
                                            // Option text
                                            Expanded(
                                              child: Text(
                                                option,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: textColor,
                                                  fontWeight: _hasAnswered && 
                                                      (idx == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex) 
                                                      ? FontWeight.bold : FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            
                                            // Trailing icon if answered
                                            if (_hasAnswered && trailingIcon != null)
                                              Icon(
                                                trailingIcon,
                                                color: idx == _randomizedQuestions[_currentQuestionIndex].correctAnswerIndex
                                                    ? AppTheme.correctColor
                                                    : AppTheme.incorrectColor,
                                                size: 20,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Feedback
                if (_hasAnswered)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _isCorrect ? AppTheme.correctBgColor : AppTheme.incorrectBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _isCorrect ? Icons.check_circle : Icons.cancel,
                              color: _isCorrect ? AppTheme.correctColor : AppTheme.incorrectColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isCorrect ? 'Correct! Well done! 👏' : 'Not quite right.',
                              style: TextStyle(
                                fontSize: 16,
                                color: _isCorrect ? AppTheme.correctColor : AppTheme.incorrectColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        
                        // Show explanation if available
                        if (_showExplanation && _randomizedQuestions[_currentQuestionIndex].explanation != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, left: 28),
                            child: Text(
                              _randomizedQuestions[_currentQuestionIndex].explanation!,
                              style: TextStyle(
                                fontSize: 14,
                                color: _isCorrect 
                                    ? AppTheme.correctColor.withOpacity(0.8) 
                                    : AppTheme.incorrectColor.withOpacity(0.8),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                
                // Next Button
                if (_hasAnswered)
                  AppTheme.gradientButton(
                    text: _currentQuestionIndex < _randomizedQuestions.length - 1
                        ? 'Next Question'
                        : 'See Results',
                    onPressed: _nextQuestion,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}