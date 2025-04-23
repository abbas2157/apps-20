# Lexi - English Learning App

![Lexi Logo](assets/images/logo.png)

Lexi is a beginner-friendly English learning application built with Flutter. The app helps users practice English vocabulary and grammar through interactive multiple-choice questions organized by difficulty level.

## Features

- **Three Difficulty Levels**:
  - **Basic Mode**: Simple vocabulary and fundamental grammar for beginners
  - **Intermediate Mode**: More complex sentences and expressions
  - **Advanced Mode**: Advanced vocabulary, complex grammar, and nuanced expressions

- **Interactive Learning**:
  - Multiple-choice questions with immediate feedback
  - Detailed explanations for each answer
  - Questions categorized by topic (vocabulary, grammar, pronunciation, etc.)
  - Visual progress tracking

- **User-Friendly Design**:
  - Clean, modern interface with intuitive navigation
  - Animated transitions and visual feedback
  - Informative mode descriptions before starting quizzes
  - Comprehensive results screen with performance analysis

- **Offline Access**:
  - Full functionality without internet connection
  - Questions stored locally for instant access

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (Latest stable version)
- Android Studio / VS Code with Flutter extensions
- Android SDK / Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/lexi_app.git
```

2. Navigate to the project folder:
```bash
cd lexi_app
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── data/
│   └── question_data.dart      (Question database with all difficulty levels)
├── models/
│   └── question.dart           (Question models and enums)
├── screens/
│   ├── home_screen.dart        (Home screen with mode selection)
│   ├── quiz_screen.dart        (Quiz screen with questions and feedback)
│   └── result_screen.dart      (Results screen showing score)
├── utils/
│   ├── app_theme.dart          (App styling and theme)
│   └── constants.dart          (App constants and text resources)
├── widgets/
│   └── mode_info_modal.dart    (Information modal for each mode)
└── main.dart                   (App entry point)
```

## Customization

### Adding Questions

Add your own questions to `data/question_data.dart` following the existing format:

```dart
EnhancedQuestion(
  questionText: "Your question here",
  options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
  correctAnswerIndex: 0, // Index of correct answer (0-based)
  difficulty: Difficulty.basic, // Or other difficulty level
  category: QuestionCategory.vocabulary, // Or other category
  explanation: "Explanation of the answer",
),
```

### Changing Theme

Modify the colors and styles in `utils/app_theme.dart` to customize the app's appearance.

## Technologies Used

- **Flutter**: UI framework for cross-platform development
- **Dart**: Programming language
- **Custom Animations**: For smooth transitions and engaging user experience
- **SVG Graphics**: For high-quality vector imagery

## Future Enhancements

- User accounts and progress tracking
- Additional question types (fill-in-the-blank, matching)
- Audio pronunciation examples
- Achievements and gamification elements
- Expanded question database
- Dark mode support

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Design inspiration from modern language learning apps
- Flutter community for excellent packages and support
- All contributors and testers who helped improve the app
