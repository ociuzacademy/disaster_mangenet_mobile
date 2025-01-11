// usermainpage/saftey_guidlines.dart
import 'package:flutter/material.dart';

import '../widgets/saftey_requests_wid.dart';

class SafteyGuidlines extends StatefulWidget {
  const SafteyGuidlines({super.key});

  @override
  _SafteyGuidlinesState createState() => _SafteyGuidlinesState();
}

class _SafteyGuidlinesState extends State<SafteyGuidlines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Requests'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Integrate the HelpRequestsWid widget here
            const SafteyRequestsWid(helptext: 'Fire',helpicon: Icons.fire_extinguisher,),
            const SafteyRequestsWid(helptext: 'Flood',helpicon: Icons.water,),
            const SafteyRequestsWid(helptext: 'Earthquack',helpicon: Icons.public,),
            const SafteyRequestsWid(helptext: 'Tsunami',helpicon: Icons.tsunami,),
            const SafteyRequestsWid(helptext: 'Cyclone',helpicon: Icons.ac_unit,),
            const SafteyRequestsWid(helptext: 'Medical Emergency',helpicon: Icons.medical_services,),
            // You can add more widgets here if needed
          ],
        ),
      ),
    );
  }
}
