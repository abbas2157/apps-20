// utils/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Primary colors from logo
  static final Color navyBlue = Color(0xFF050A30);
  static final Color primaryPurple = Color(0xFF7B2CBF);
  static final Color brightCyan = Color(0xFF22D1EE);
  static final Color hotPink = Color(0xFFFF5BC8);
  
  // Gradients from logo
  static final Gradient purpleToCyanGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [hotPink, primaryPurple, brightCyan],
  );
  
  static final Gradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [brightCyan, primaryPurple],
  );
  
  // Text and UI colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static final Color textDark = navyBlue;
  
  // Feedback colors
  static final Color correctColor = Color(0xFF11D876);
  static final Color incorrectColor = Color(0xFFFF4D6D);
  static final Color correctBgColor = Color(0xFFE0FFF0);
  static final Color incorrectBgColor = Color(0xFFFFE0E6);
  
  // Button styles
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: navyBlue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 4,
  );
  
  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: navyBlue,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 4,
  );
  
  static final ButtonStyle gradientButtonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 4,
  );
  
  // Card styling
  static final cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: navyBlue.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  );
  
  // Background gradient for screens
  static LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [navyBlue, navyBlue.withOpacity(0.8)],
  );
  
  // Light theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: navyBlue,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
      primary: navyBlue,
      secondary: primaryPurple,
      tertiary: brightCyan,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        letterSpacing: 6,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textDark,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: textDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: textDark.withOpacity(0.7),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: primaryButtonStyle,
    ),
    appBarTheme: AppBarTheme(
      color: navyBlue,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
  
  // Widgets with gradient backgrounds
  static Widget gradientButton({
    required String text,
    required VoidCallback onPressed,
    double width = double.infinity,
    TextStyle? textStyle,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: purpleToCyanGradient,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: primaryPurple.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: textStyle ?? 
            TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
      ),
    );
  }
  
  static Widget gradientContainer({
    required Widget child,
    required BuildContext context,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
  }) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        gradient: backgroundGradient,
      ),
      child: child,
    );
  }
}