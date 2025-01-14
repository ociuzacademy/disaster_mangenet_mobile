import 'package:flutter/material.dart';

class StockEntryPage extends StatefulWidget {
  const StockEntryPage({Key? key}) : super(key: key);

  @override
  State<StockEntryPage> createState() => _StockEntryPageState();
}

class _StockEntryPageState extends State<StockEntryPage> {
  // Sample stock data - replace with your actual data
  final List<Map<String, dynamic>> stockItems = [
    {
      'itemName': 'Rice',
      'currentStock': 100,
      'unit': 'kg',
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Wheat Flour',
      'currentStock': 50,
      'unit': 'kg',
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Sugar',
      'currentStock': 30,
      'unit': 'kg',
      'lastUpdated': '2024-01-13',
    },
    {
      'itemName': 'Cooking Oil',
      'currentStock': 20,
      'unit': 'L',
      'lastUpdated': '2024-01-13',
    },
  ];

  // Map to track quantity changes
  Map<int, int> quantityChanges = {};

  void updateQuantity(int index, int amount) {
    setState(() {
      quantityChanges[index] = (quantityChanges[index] ?? 0) + amount;
      // Ensure stock doesn't go below 0
      if ((stockItems[index]['currentStock'] + (quantityChanges[index] ?? 0)) <
          0) {
        quantityChanges[index] = -stockItems[index]['currentStock'];
      }
    });
  }

  void submitStockChanges() {
    // Here you would typically send the updates to your backend
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stock Update Summary'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quantityChanges.entries.map((entry) {
              final itemName = stockItems[entry.key]['itemName'];
              final unit = stockItems[entry.key]['unit'];
              final change = entry.value;
              return Text(
                '$itemName: ${change > 0 ? '+' : ''}$change $unit',
                style: const TextStyle(fontSize: 16),
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
        title: const Text('Stock Entry'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: stockItems.length,
              itemBuilder: (context, index) {
                final item = stockItems[index];
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['itemName'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Current: $currentTotal ${item['unit']}',
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
                                    color: currentChange > 0
                                        ? Colors.green
                                        : Colors.red,
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
