import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/campListPage/models/campmodel.dart';
import 'package:disaster_management/modules/campListPage/services/campservice.dart';
import 'package:flutter/material.dart';

class CampPage extends StatelessWidget {
  // Simulate fetching data asynchronously
  Future<List<Map<String, dynamic>>> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      {
        "id": 4,
        "name": "dd",
        "district": "Pathanamthitta",
        "address": "aa",
        "gmap_link":
            "https://www.google.com/maps/dir//G6C3%2BX8Q,+IIIrd+Floor,+Bhuhari+Tower,+Sankarayya+Jn,+M+G+Road,+Kuttipuzha+Nagar,+Poothole,+MG+Road,+Sreenagar+Colony,+Thrissur,+Kerala+680004/@10.5224394,76.1210491,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3ba7ee418e6ef7d7:0x5da64b3c153db364!2m2!1d76.203451!2d10.52245?entry=ttu&g_ep=EgoyMDI0MTAwNy4xIKXMDSoASAFQAw%3D%3D",
        "latitude": 76.203451,
        "longitude": 10.52245,
        "capacity": 8,
        "contact_person": "x",
        "contact_phone": "234",
        "contact_email": "a@gmail.com",
        "description": "zxx",
        "profile_pic": "https://via.placeholder.com/150", // Sample image URL
      },
      {
        "id": 7,
        "name": "a",
        "district": "Pathanamthitta",
        "address": "vgvs",
        "gmap_link":
            "https://www.google.com/maps/dir//G6C3%2BX8Q,+IIIrd+Floor,+Bhuhari+Tower,+Sankarayya+Jn,+M+G+Road,+Kuttipuzha+Nagar,+Poothole,+MG+Road,+Sreenagar+Colony,+Thrissur,+Kerala+680004/@10.5224394,76.1210491,12z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3ba7ee418e6ef7d7:0x5da64b3c153db364!2m2!1d76.203451!2d10.52245?entry=ttu&g_ep=EgoyMDI0MTAwNy4xIKXMDSoASAFQAw%3D%3D",
        "latitude": 76.203451,
        "longitude": 10.52245,
        "capacity": 1,
        "contact_person": "ss",
        "contact_phone": "1",
        "contact_email": "a@gmail.com",
        "description": "",
        "profile_pic": null,
      },
    ];
  }

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
                      // TextButton(
                      //   onPressed: () {
                      //     print("Opening map link: ${item['gmap_link']}");
                      //   },
                      //   child: Text("View on Map"),
                      // ),
                      Image.network(
                        ImageUrl + item.profilePic,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Text("Image not available");
                        },
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
