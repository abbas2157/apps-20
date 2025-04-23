// models/question.dart
class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  
  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

// Enum for difficulty levels
enum Difficulty {
  basic,
  intermediate,
  advanced
}

// Enum for question categories
enum QuestionCategory {
  vocabulary,
  grammar,
  pronunciation,
  conversation,
  idioms
}

// Extended Question model with additional properties
class EnhancedQuestion extends Question {
  final Difficulty difficulty;
  final QuestionCategory category;
  final String? explanation;
  
  EnhancedQuestion({
    required String questionText,
    required List<String> options,
    required int correctAnswerIndex,
    required this.difficulty,
    required this.category,
    this.explanation,
  }) : super(
         questionText: questionText,
         options: options,
         correctAnswerIndex: correctAnswerIndex,
       );
}