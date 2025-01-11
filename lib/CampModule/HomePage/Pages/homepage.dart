import 'package:disaster_management/CampModule/RefugeeaddPage/Pages/refugeeaddpage.dart';
import 'package:disaster_management/CampModule/RequestPage/requestpage.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  // Dummy data
  final List<Map<String, String>> userList = [
    {
      "name": "John Doe",
      "number": "001",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Jane Smith",
      "number": "002",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Sam Wilson",
      "number": "003",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Emma Watson",
      "number": "004",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Chris Evans",
      "number": "005",
      "image": "https://via.placeholder.com/150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camp Refugee List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(user['image']!),
                radius: 25,
              ),
              title: Text(
                user['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('ID: ${user['number']}'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RequestPage()));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RefugeeInfoPage()));
        }, // Show the SOS dialog
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white, // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
