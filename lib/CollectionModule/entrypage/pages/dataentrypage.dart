import 'package:disaster_management/CollectionModule/entrypage/widget/stock_enterycard.dart';
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
      'stock': 'Add New Food Stock',
      'icon': Icons.fastfood,
    },
    {
      'title': 'Dress',
      'stock': 'Add New Dress Stock',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Medicine',
      'stock': 'Add New Medicine Stock',
      'icon': Icons.local_hospital,
    },
    {
      'title': 'Other',
      'stock': 'Add New Others Stock',
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
        backgroundColor: Colors.grey[200],
        elevation: 2,
      ),
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CouponCard(
                  backgroundColor: const Color.fromARGB(255, 251, 219, 219),
                  brand: category['title'],
                  details: category['stock'],
                  title: category['title'],
                  validUntil: '',
                  icon: category['icon'],
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
