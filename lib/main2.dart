import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  String _selectedTone = 'Silent';
  String _selectedVibrate = 'Off';
  String _selectedLight = 'White';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1F2937), // Dark background color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification Tone Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notification tone',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _selectedTone,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    // Handle tone selection
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xFF1F2937),
                        title: const Text(
                          'Select Tone',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'Silent',
                            'Default',
                            'Tone 1',
                            'Tone 2'
                          ].map((tone) => RadioListTile(
                            title: Text(
                              tone,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: tone,
                            groupValue: _selectedTone,
                            onChanged: (value) {
                              setState(() {
                                _selectedTone = value.toString();
                              });
                              Navigator.pop(context);
                            },
                          )).toList(),
                        ),
                      ),
                    );
                  },
                ),
                const Divider(color: Colors.grey, height: 1),
              ],
            ),
            const SizedBox(height: 16),

            // Vibrate Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vibrate',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _selectedVibrate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xFF1F2937),
                        title: const Text(
                          'Select Vibration',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'Off',
                            'Default',
                            'Short',
                            'Long'
                          ].map((vibrate) => RadioListTile(
                            title: Text(
                              vibrate,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: vibrate,
                            groupValue: _selectedVibrate,
                            onChanged: (value) {
                              setState(() {
                                _selectedVibrate = value.toString();
                              });
                              Navigator.pop(context);
                            },
                          )).toList(),
                        ),
                      ),
                    );
                  },
                ),
                const Divider(color: Colors.grey, height: 1),
              ],
            ),
            const SizedBox(height: 16),

            // Light Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Light',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _selectedLight,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xFF1F2937),
                        title: const Text(
                          'Select Light',
                          style: TextStyle(color: Colors.white),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'White',
                            'Red',
                            'Blue',
                            'Green'
                          ].map((light) => RadioListTile(
                            title: Text(
                              light,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: light,
                            groupValue: _selectedLight,
                            onChanged: (value) {
                              setState(() {
                                _selectedLight = value.toString();
                              });
                              Navigator.pop(context);
                            },
                          )).toList(),
                        ),
                      ),
                    );
                  },
                ),
                const Divider(color: Colors.grey, height: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}