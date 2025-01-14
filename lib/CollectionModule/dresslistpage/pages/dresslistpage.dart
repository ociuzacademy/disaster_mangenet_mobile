import 'package:flutter/material.dart';

class DressStockEntryPage extends StatefulWidget {
  const DressStockEntryPage({Key? key}) : super(key: key);

  @override
  State<DressStockEntryPage> createState() => _DressStockEntryPageState();
}

class _DressStockEntryPageState extends State<DressStockEntryPage> {
  // Sample dress stock data
  final List<Map<String, dynamic>> dressItems = [
    {
      'itemName': 'Floral Summer Dress',
      'size': 'M',
      'color': 'Blue',
      'currentStock': 15,
      'price': 599.00,
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Evening Gown',
      'size': 'L',
      'color': 'Black',
      'currentStock': 8,
      'price': 1299.00,
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Casual Maxi Dress',
      'size': 'S',
      'color': 'Red',
      'currentStock': 20,
      'price': 799.00,
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Party Wear',
      'size': 'XL',
      'color': 'Purple',
      'currentStock': 12,
      'price': 999.00,
      'lastUpdated': '2024-01-13',
    },
  ];

  // Map to track quantity changes
  Map<int, int> quantityChanges = {};

  void updateQuantity(int index, int amount) {
    setState(() {
      quantityChanges[index] = (quantityChanges[index] ?? 0) + amount;
      // Ensure stock doesn't go below 0
      if ((dressItems[index]['currentStock'] + (quantityChanges[index] ?? 0)) < 0) {
        quantityChanges[index] = -dressItems[index]['currentStock'];
      }
    });
  }

  void submitStockChanges() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stock Update Summary'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quantityChanges.entries.map((entry) {
              final item = dressItems[entry.key];
              final change = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['itemName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Size: ${item['size']} | Color: ${item['color']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Change: ${change > 0 ? '+' : ''}$change pieces',
                      style: TextStyle(
                        fontSize: 14,
                        color: change > 0 ? Colors.green : Colors.red,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dress Stock Entry'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: dressItems.length,
              itemBuilder: (context, index) {
                final item = dressItems[index];
                final currentChange = quantityChanges[index] ?? 0;
                final currentTotal = item['currentStock'] + currentChange;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['itemName'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('Size: ${item['size']}'),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('Color: ${item['color']}'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price: ₹${item['price'].toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'In Stock: $currentTotal',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Last Updated: ${item['lastUpdated']}',
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => updateQuantity(index, -1),
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: Colors.red,
                                ),
                                Text(
                                  '${currentChange > 0 ? '+' : ''}$currentChange',
                                  style: TextStyle(
                                    color: currentChange > 0 ? Colors.green : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => updateQuantity(index, 1),
                                  icon: const Icon(Icons.add_circle_outline),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: quantityChanges.isNotEmpty ? submitStockChanges : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Submit Stock Changes',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}