import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/campListPage/models/campmodel.dart';
import 'package:disaster_management/modules/campListPage/services/campservice.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CampPage extends StatefulWidget {
  @override
  _CampPageState createState() => _CampPageState();
}

class _CampPageState extends State<CampPage> {
  String? selectedDistrict;
  List<String> districts = [];
  late Future<CampsModel?> campDataFuture;

  @override
  void initState() {
    super.initState();
    campDataFuture = fetchCampData();
  }

  Future<CampsModel?> fetchCampData() async {
    final data = await CampDetails();
    if (data != null) {
      setState(() {
        districts = data.data.map((camp) => camp.district).toSet().toList();
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camp List", style: TextStyle(fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 140,
              child: DropdownButton<String>(
                hint: Text(
                  "Select District",
                  style: TextStyle(fontSize: 14),
                ),
                value: selectedDistrict,
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                    value: null,
                    child: Text(
                      "All Districts",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ...districts.map((district) {
                    return DropdownMenuItem(
                      value: district,
                      child: Text(
                        district,
                        style: TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<CampsModel?>(
        future: campDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return Center(child: Text("No data available."));
          }

          final data = snapshot.data!;
          final filteredData = selectedDistrict == null
              ? data.data
              : data.data
                  .where((camp) => camp.district == selectedDistrict)
                  .toList();

          return ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (context, index) {
              final item = filteredData[index];
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
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text("District: ${item.district}"),
                      Text("Address: ${item.address}"),
                      Text("Capacity: ${item.capacity}"),
                      SizedBox(height: 8),
                      Text("Contact Person: ${item.contactPerson}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Phone: ${item.contactPhone}"),
                      Text("Email: ${item.contactEmail}"),
                      SizedBox(height: 8),
                      if (item.description.isNotEmpty)
                        Text("Description: ${item.description}",
                            style: TextStyle(color: Colors.grey[700])),
                      SizedBox(height: 8),
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
