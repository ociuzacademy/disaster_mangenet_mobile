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
        title: const Text(
          'precautions',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Integrate the HelpRequestsWid widget here
              const SafteyRequestsWid(
                helptext: 'Fire',
                helpicon: Icons.fire_extinguisher,
                videos: [
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/Xgc90CoJbDI?feature=shared"
                  },
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/7CzvIArUrRw?feature=shared"
                  },
                ], title: 'Fire Safety', subcontent: '1.Before a Fire:.Install Smoke Detectors:Ensure smoke detectors are installed in key areas like the kitchen, bedrooms, and hallways. Test them monthly and change batteries at least once a year..Create an Emergency Plan:Develop and practice a fire escape plan with all family members. Ensure everyone knows two ways out of every room, and designate a meeting point outside the home.Maintain Fire Extinguishers:Keep fire extinguishers in accessible locations (kitchen, garage, etc.) and make sure they are in working condition. Learn how to use them (PASS: Pull, Aim, Squeeze, Sweep)..Keep Flammable Items Away from Heat Sources:Store paper, rags, and other flammable materials away from heat sources like stoves, heaters, or electrical equipment..Check Wiring and Appliances:Have an electrician inspect wiring for any signs of wear or damage.-Unplug electrical appliances when not in use, especially high-wattage items like space heaters..Plan for Special Needs:If you have elderly family members, children, or anyone with mobility challenges, make sure their evacuation route is clear and practiced.'


              ),
              const SafteyRequestsWid(
                helptext: 'Flood',
                helpicon: Icons.water,
                videos: [
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/pi_nUPcQz_A?feature=shared"
                  },
                ], title: 'Flood', subcontent: '2. During a Flood:Stay informed: Keep up with local weather updates via radio, television, or smartphone apps. Follow evacuation orders from authorities.Avoid floodwaters: Never attempt to walk, swim, or drive through flooded areas. Just six inches of moving water can knock you down, and one foot of water can sweep a car away.Move to higher ground: If flooding is imminent, move to higher ground or an upper floor if you are in a building. Avoid low-lying areas that are prone to flooding.Stay indoors: Remain inside and avoid using electrical appliances that could pose a shock hazard if exposed to water.Close doors and windows: If floodwaters are near, close all doors and windows to slow water entry. Use towels or cloths to seal any gaps.',
              ),
              const SafteyRequestsWid(
                helptext: 'Earthquake',
                helpicon: Icons.public,
                videos: [
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/MllUVQM3KVk?feature=shared"
                  },
                ], title: 'Earthquake safety', subcontent: '1. Before an Earthquake (Preparation):Secure heavy objects: Fasten bookshelves, cabinets, and large furniture to walls to prevent them from falling during an earthquake. Place heavy objects on lower shelves to minimize the risk of them toppling.Reinforce your home: If you live in an area prone to earthquakes, consider retrofitting your home with earthquake-resistant features such as bolting the foundation to the structure and securing roof frames.Create an emergency kit: Assemble a kit with essentials like:Water (at least one gallon per person per day for 72 hours)Non-perishable food-Flashlights and extra batteriesFirst aid supplies-Medications and a spare prescriptionImportant documents (stored in a waterproof bag)A portable phone chargerA whistle or signaling deviceKnow your evacuation routes: Identify safe spots in your home, like under sturdy furniture, where you can take cover. Also, familiarize yourself with evacuation routes in case of severe damage or aftershocks.Practice earthquake drills: Regularly practice "Drop, Cover, and Hold On" drills with your family or household members, so everyone knows what to do during an earthquake..Prepare for aftershocks: After an earthquake, smaller aftershocks often follow. Be ready to protect yourself again, as these can be just as dangerous',
              ),
              const SafteyRequestsWid(
                helptext: 'Tsunami',
                helpicon: Icons.tsunami,
                videos: [
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/GVBamXXVD30"
                  },
                ], title: '', subcontent: '',
              ),
              const SafteyRequestsWid(
                helptext: 'Cyclone',
                helpicon: Icons.ac_unit,
                videos: [
                  {
                    "title": "Training Video 1",
                    "url": "https://youtu.be/xHRbnuB9F1I?feature=shared"
                  },
                ], title: 'Cyclone Satety', subcontent: '',
              ),

              // You can add more widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
