// utils/constants.dart
class AppConstants {
  // App Info
  static const String appName = 'Lexi';
  static const String appTagline = 'Learn English the Easy Way';
  static const String appVersion = '1.0.0';
  
  // Difficulty Descriptions
  static const Map<String, String> difficultyDescriptions = {
    'basic': 'Simple vocabulary and grammar for beginners',
    'intermediate': 'More complex sentences and expressions',
    'advanced': 'Advanced grammar, idioms, and nuanced vocabulary',
  };
  
  // Category Descriptions
  static const Map<String, String> categoryDescriptions = {
    'vocabulary': 'Learn new words and their meanings',
    'grammar': 'Practice correct sentence structure and grammar rules',
    'pronunciation': 'Learn to pronounce English words correctly',
    'conversation': 'Practice everyday conversational phrases',
    'idioms': 'Learn common English expressions and idioms',
  };
  
  // Result Messages
  static const Map<String, List<String>> resultMessages = {
    'excellent': [
      'Outstanding work!',
      'You\'re a natural at this!',
      'Impressive knowledge!',
      'Fantastic job!',
    ],
    'good': [
      'Good effort!',
      'You\'re making progress!',
      'Keep it up!',
      'Nice work!',
    ],
    'needs_improvement': [
      'Practice makes perfect!',
      'Don\'t give up!',
      'Keep learning!',
      'You\'ll get better with practice!',
    ],
  };
  
  // Achievement Thresholds
  static const int excellentThreshold = 80; // 80% or higher
  static const int goodThreshold = 60; // 60-79%
  
  // Animation Durations
  static const int shortAnimationDuration = 300; // milliseconds
  static const int mediumAnimationDuration = 500; // milliseconds
  static const int longAnimationDuration = 800; // milliseconds
}