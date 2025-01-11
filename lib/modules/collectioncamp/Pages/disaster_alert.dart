import 'package:disaster_management/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:disaster_management/modules/collectioncamp/Models/collectiocentermodel.dart';
import 'package:disaster_management/modules/collectioncamp/service/collectionlistservice.dart';

class CollectionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collection Centers"),
      ),
      body: FutureBuilder<CollectionCenterModel>(
        future: Collectiodetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("An error occurred: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
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
                      if (item.profilePic != null && item.profilePic.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            ImageUrl + item.profilePic!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  "Image not available",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              );
                            },
                          ),
                        ),
                      SizedBox(height: 8),
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
                      SizedBox(height: 8),
                      Text(
                        "Contact Person: ${item.contactPerson}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Phone: ${item.contactPhone}"),
                      Text("Email: ${item.contactEmail}"),
                      SizedBox(height: 8),
                      Text(
                        "Description: ${item.description}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
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
