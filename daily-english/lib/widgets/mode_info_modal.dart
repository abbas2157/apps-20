// widgets/mode_info_modal.dart
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';

class ModeInfoModal extends StatelessWidget {
  final Difficulty difficulty;
  
  const ModeInfoModal({Key? key, required this.difficulty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mode details
    String title;
    String description;
    Color primaryColor;
    List<String> keyPoints = [];
    IconData modeIcon;
    
    switch (difficulty) {
      case Difficulty.basic:
        title = "Basic Mode";
        description = "Perfect for beginners learning English fundamentals";
        primaryColor = AppTheme.brightCyan;
        modeIcon = Icons.school_outlined;
        keyPoints = [
          "Simple vocabulary and common words",
          "Basic grammar and sentence structures",
          "Everyday expressions and phrases",
          "Recommended for absolute beginners"
        ];
        break;
        
      case Difficulty.intermediate:
        title = "Intermediate Mode";
        description = "Build on your basics with more complex language";
        primaryColor = AppTheme.primaryPurple;
        modeIcon = Icons.psychology;
        keyPoints = [
          "Expanded vocabulary and expressions",
          "Complex grammar structures and tenses",
          "Common idioms and phrasal verbs",
          "Perfect for those with basic English knowledge"
        ];
        break;
        
      case Difficulty.advanced:
        title = "Advanced Mode";
        description = "Challenge yourself with sophisticated English";
        primaryColor = AppTheme.hotPink;
        modeIcon = Icons.workspace_premium;
        keyPoints = [
          "Advanced vocabulary and nuanced meanings",
          "Complex grammatical structures",
          "Uncommon idioms and expressions",
          "Suitable for upper-intermediate to advanced learners"
        ];
        break;
        
      default:
        title = "Quiz Mode";
        description = "Test your English knowledge";
        primaryColor = AppTheme.brightCyan;
        modeIcon = Icons.quiz;
        keyPoints = ["Various questions to test your English skills"];
    }
    
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, title, description, primaryColor, keyPoints, modeIcon),
    );
  }
  
  Widget contentBox(
    BuildContext context,
    String title,
    String description,
    Color primaryColor,
    List<String> keyPoints,
    IconData modeIcon,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Mode icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              modeIcon,
              color: primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.navyBlue,
            ),
          ),
          const SizedBox(height: 8),
          
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          
          // Key points
          ...keyPoints.map((point) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle,
                  color: primaryColor,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
          
          const SizedBox(height: 24),
          
          // Start button
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Return true for starting the mode
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Cancel button
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Return false for cancellation
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}