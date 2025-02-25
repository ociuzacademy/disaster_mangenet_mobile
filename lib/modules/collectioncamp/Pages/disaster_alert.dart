import 'package:flutter/material.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/collectioncamp/Models/collectiocentermodel.dart';
import 'package:disaster_management/modules/collectioncamp/service/collectionlistservice.dart';

class CollectionListPage extends StatefulWidget {
  @override
  _CollectionListPageState createState() => _CollectionListPageState();
}

class _CollectionListPageState extends State<CollectionListPage> {
  String? selectedDistrict;
  List<String> districts = [];
  TextEditingController searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _fetchDistricts();
  }

  Future<void> _fetchDistricts() async {
    final data = await Collectiodetails();
    if (mounted) {
      setState(() {
        districts = data.data.map((e) => e.district).toSet().toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Collection Centers",
          style: TextStyle(fontSize: 16),
        ),
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
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by name...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),

          Expanded(
            child: FutureBuilder<CollectionCenterModel>(
              future: Collectiodetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text("An error occurred: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                  return Center(child: Text("No data available."));
                }

                final allCenters = snapshot.data!.data;

                // ✅ Filter list based on selected district and search query
                final filteredCenters = allCenters.where((center) {
                  final matchesDistrict = selectedDistrict == null ||
                      center.district == selectedDistrict;
                  final matchesSearch =
                      center.name?.toLowerCase().contains(_searchQuery) ??
                          false;
                  return matchesDistrict && matchesSearch;
                }).toList();

                return ListView.builder(
                  itemCount: filteredCenters.length,
                  itemBuilder: (context, index) {
                    final item = filteredCenters[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.profilePic != null &&
                                item.profilePic.isNotEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  ImageUrl + item.profilePic!,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                (loadingProgress
                                                        .expectedTotalBytes ??
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
          ),
        ],
      ),
    );
  }
}
