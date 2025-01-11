// widgets/saftey_requests_wid.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../usermainpage/saftey_documentation.dart';
import '../usermainpage/saftey_videotraining.dart';

class SafteyRequestsWid extends StatefulWidget {
  final String helptext;
  final IconData helpicon; // Changed from String to IconData

  const SafteyRequestsWid({
    super.key,
    required this.helptext,
    required this.helpicon, // Change to IconData
  });

  @override
  State<SafteyRequestsWid> createState() => _SafteyRequestsWidState();
}

class _SafteyRequestsWidState extends State<SafteyRequestsWid> {
  bool _showFireButtons = false; // Define the boolean variable

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Fire Request Container
          GestureDetector(
            onTap: () {
              setState(() {
                _showFireButtons =
                    !_showFireButtons; // Toggle the button visibility
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[50], // Background color for fire
                border: Border.all(color: Colors.red, width: 0.5), // Border
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Icon(
                        widget.helpicon,
                        color: Colors.red,
                      ), // Use the helpicon
                      const SizedBox(width: 10), // Space between icon and text
                      Text(
                        widget.helptext, // Use widget.helptext
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ), // Arrow icon
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (_showFireButtons) // Show Fire-related buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Align buttons evenly in the row
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SafteyVideotraining(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Rounded corners
                      ),
                    ),
                     child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the content
                      children: [
                        const Text(
                          'Video Training',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8), // Spacing between text and icon
                        const Icon(
                          Icons.arrow_forward_ios,size: 15, // You can choose any arrow icon
                          color: Colors.white, // Icon color
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 10), // Use width instead of height for spacing
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SafteyDocumentation(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                     child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center the content
                      children: [
                        const Text(
                          'Documentation',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8), // Spacing between text and icon
                        const Icon(
                          Icons.arrow_forward_ios,size: 15, // You can choose any arrow icon
                          color: Colors.white, // Icon color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
