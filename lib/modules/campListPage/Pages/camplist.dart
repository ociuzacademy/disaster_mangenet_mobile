import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/campListPage/models/campmodel.dart';
import 'package:disaster_management/modules/campListPage/services/campservice.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CampPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camp List"),
      ),
      body: FutureBuilder<CampsModel>(
        future: CampDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("No data available."));
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              final item = data.data[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? "No Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("District: ${item.district}"),
                      Text("Address: ${item.address}"),
                      Text("Capacity: ${item.capacity}"),
                      SizedBox(height: 8),
                      Text(
                        "Contact Person: ${item.contactPerson}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Phone: ${item.contactPhone}"),
                      Text("Email: ${item.contactEmail}"),
                      SizedBox(height: 8),
                      if (item.description != "")
                        Text(
                          "Description: ${item.description}",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.network(
                              ImageUrl + item.profilePic,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text("Image not available");
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.location_city, color: Colors.blue),
                            onPressed: () async {
                              final Uri mapUri = Uri.parse(
                                  "https://www.google.com/maps/search/?api=1&query=${item.latitude},${item.longitude}");
                              if (await canLaunchUrl(mapUri)) {
                                await launchUrl(mapUri);
                              } else {
                                throw 'Could not launch $mapUri';
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
