// widgets/emergency_call_button.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCallButton extends StatelessWidget {
  const EmergencyCallButton({Key? key}) : super(key: key);

  Future<void> _showEmergencyCallDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.warning, color: Colors.red),
              SizedBox(width: 10),
              Text('Emergency Call'),
            ],
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Are you sure you want to call emergency services?'),
                SizedBox(height: 12),
                Text(
                  'This will dial your local emergency number.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'CALL NOW',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _makeEmergencyCall();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _makeEmergencyCall() async {
    // This would ideally use the local emergency number based on user's location/settings
    // For this example, using a placeholder
    final Uri phoneUri = Uri(scheme: 'tel', path: '911');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showEmergencyCallDialog(context),
      backgroundColor: Colors.red,
      child: const Icon(Icons.phone, color: Colors.white),
      elevation: 8,
    );
  }
}