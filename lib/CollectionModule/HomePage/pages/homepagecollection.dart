import 'package:disaster_management/CollectionModule/dresslistpage/pages/dresslistpage.dart';
import 'package:disaster_management/CollectionModule/foodlistpage/pages/foodlistpage.dart';
import 'package:disaster_management/CollectionModule/medicinelistpage/page/medicinelistpage.dart';
import 'package:disaster_management/CollectionModule/other_stock_list/pages/others_stock_list.dart';
import 'package:flutter/material.dart';

class CollectionHomePage extends StatefulWidget {
  @override
  State<CollectionHomePage> createState() => _CollectionHomePageState();
}

class _CollectionHomePageState extends State<CollectionHomePage> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Food',
      'stock': 'Update Foods',
      'icon': Icons.fastfood,
    },
    {
      'title': 'Dress',
      'stock': 'Update Dress',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'Medicine',
      'stock': 'Update Medicine',
      'icon': Icons.local_hospital,
    },
    {
      'title': 'Other',
      'stock': 'Update Other',
      'icon': Icons.category,
    },
  ];

  // List of pages corresponding to each category
  final List<Widget> pages = [
    StockEntryPage(),
    DressStockEntryPage(),
    MedicineStockEntryPage(),
    OtherStockEntryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Home'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              shadowColor: Colors.grey,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: Icon(
                  category['icon'],
                  size: 40,
                  color: Colors.blue,
                ),
                title: Text(
                  category['title'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  category['stock'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pages[index]),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
