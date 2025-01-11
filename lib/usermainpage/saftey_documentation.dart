// usermainpage/saftey_documentation.dart
import 'package:flutter/material.dart';

class SafteyDocumentation extends StatelessWidget {
  const SafteyDocumentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Documentation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Training Documentation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to the training documentation. Here you will find all the necessary information to help you navigate through the application effectively.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '1. Getting Started',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'To get started, simply log in to your account and explore the various features available.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '2. Features Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Our application offers a variety of features to assist you. Be sure to check the settings for customization options.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '3. User Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'You can manage your personal information and preferences in the User Profile section.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '4. Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Stay updated with the latest notifications regarding your activities and account status.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '5. Support & Feedback',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'For any queries or feedback, reach out to our support team through the app.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '6. Frequently Asked Questions (FAQ)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Check out our FAQ section for answers to common questions about the application.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '7. App Updates',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Keep an eye on our app updates to access new features and improvements.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '8. Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'For further assistance, feel free to contact us through the contact form provided in the app.',
                style: TextStyle(fontSize: 14),
              ),
              // Add more sections as needed
            ],
          ),
        ),
      ),
    );
  }
}
