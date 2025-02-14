import 'package:disaster_management/CollectionModule/medicineentrymodule/pages/medicineentrypage.dart';
import 'package:disaster_management/CollectionModule/other_entery_page/views/others_enter_page.dart';
import 'package:flutter/material.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/pages/dressentrypage.dart';
// Import the pages for Food, Medicine, and Other
import 'package:disaster_management/CollectionModule/foodentrypage/pages/foodentrypage.dart';

class EntryPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Food',
      'stock': 'Available',
      'icon': Icons.fastfood,
    },
    {
      'title': 'Dress',
      'stock': 'Limited',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Medicine',
      'stock': 'In Stock',
      'icon': Icons.local_hospital,
    },
    {
      'title': 'Other',
      'stock': 'Out of Stock',
      'icon': Icons.category,
    },
  ];

  // List of pages corresponding to each category
  final List<Widget> pages = [
    AddFoodItemPage(),
    AddDressItemPage(),
    AddMedicinePage(),
    OthersEnteryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Home Page'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'],
                        size: 50,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        category['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        category['stock'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
