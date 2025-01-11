// usermainpage/news_detail_page.dart
import 'package:flutter/material.dart';

class NewsDeatilPage extends StatelessWidget {
  const NewsDeatilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://cdn.britannica.com/34/127134-050-49EC55CD/Building-foundation-earthquake-Japan-Kobe-January-1995.jpg', // Replace with your image URL
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 16),

            // Heading
            const Text(
              'Earthquake Detected',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                const Text(
                  'Kozhikode,town',
                  style: TextStyle(color: Colors.grey),
                ), // Replace with actual location

                const SizedBox(width: 16),

                const Icon(
                  Icons.access_time,
                  color: Colors.red,
                ),
                const SizedBox(width: 4),
                const Text(
                  '10:10 Am, 25-11-2024',
                  style: TextStyle(color: Colors.grey),
                ), // Replace with actual time
              ],
            ),
            const SizedBox(height: 16),

            // Description
            const Text(
              'Earthquake Detected! Please take immediate safety precautions.Attention: An earthquake has been detected in your area. Seek shelter and stay safe.Earthquake Alert: A seismic event has been recorded. Stay indoors and avoid standing near windows.Warning: An earthquake has been detected! Secure your surroundings and prepare for aftershocks.Earthquake detected. Drop, cover, and hold on until the shaking stops.',
              style: TextStyle(fontSize: 14,color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
