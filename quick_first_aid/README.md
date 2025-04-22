# QuickFirstAid

QuickFirstAid is a lightweight mobile application designed to provide users with instant, offline access to essential first aid procedures. The app is built with Flutter to work across iOS and Android platforms.

![QuickFirstAid Logo](assets/images/logo.png)

## Features

- **Offline Access**: All content available without internet connection
- **Emergency Calling**: Quick access to emergency services
- **Step-by-Step Instructions**: Clear, concise first aid procedures
- **Visual Indicators**: Color-coded urgency levels
- **Do's and Don'ts**: Quick reference for each procedure
- **Bookmarks**: Save frequently used procedures
- **Dark Mode**: Comfortable viewing in all lighting conditions

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (2.0.0 or higher)
- [Dart](https://dart.dev/get-dart) (2.12.0 or higher)
- Android Studio or VS Code with Flutter extensions

### Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/quick_first_aid.git
```

2. Navigate to the project directory:
```bash
cd quick_first_aid
```

3. Get dependencies:
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
  ├── models/            # Data models
  ├── providers/         # State management
  ├── screens/           # UI screens
  ├── widgets/           # Reusable components
  └── main.dart          # Entry point
```

## Dependencies

- [provider](https://pub.dev/packages/provider): State management
- [url_launcher](https://pub.dev/packages/url_launcher): For emergency calls

## Customization

### Adding New First Aid Procedures

To add a new first aid procedure, edit the `_loadData()` method in `providers/first_aid_data_provider.dart`:

```dart
Procedure(
  id: "unique_id",
  title: "Procedure Title",
  category: "category_id",
  urgencyLevel: "critical|moderate|low",
  estimatedTime: "Time description",
  seekHelp: "When to seek professional help",
  overview: "Brief overview of the condition",
  steps: [
    ProcedureStep(
      stepNumber: 1,
      heading: "Step heading",
      instruction: "Detailed instruction",
      icon: "icon_name", // Optional
    ),
    // Additional steps...
  ],
  dos: [
    "Do this",
    "And this",
  ],
  donts: [
    "Don't do this",
    "Or this",
  ],
)
```

### Modifying Emergency Numbers

Update the emergency call functionality in `widgets/emergency_call_button.dart` to use your region's emergency services number.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Privacy Policy

See [PRIVACY.md](PRIVACY.md) for details on our privacy policy.

## Contact

Project Link: [https://github.com/yourusername/quick_first_aid](https://github.com/yourusername/quick_first_aid)

## Acknowledgements

- [Flutter](https://flutter.dev)
- [Material Design](https://material.io/design)
- Medical information is provided for educational purposes only. Always seek professional medical help in emergencies.
