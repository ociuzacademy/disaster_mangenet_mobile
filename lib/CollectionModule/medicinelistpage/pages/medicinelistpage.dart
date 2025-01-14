import 'package:flutter/material.dart';

class MedicineStockEntryPage extends StatefulWidget {
  const MedicineStockEntryPage({Key? key}) : super(key: key);

  @override
  State<MedicineStockEntryPage> createState() => _MedicineStockEntryPageState();
}

class _MedicineStockEntryPageState extends State<MedicineStockEntryPage> {
  // Sample medicine stock data
  final List<Map<String, dynamic>> medicineItems = [
    {
      'name': 'Paracetamol 500mg',
      'type': 'Tablet',
      'batchNumber': 'BT2024001',
      'currentStock': 500,
      'expiryDate': '2025-06-30',
      'manufacturer': 'PharmaCo',
      'price': 2.50,
      'lastUpdated': '2024-01-13',
    },
    {
      'name': 'Amoxicillin 250mg',
      'type': 'Capsule',
      'batchNumber': 'BT2024002',
      'currentStock': 200,
      'expiryDate': '2025-03-15',
      'manufacturer': 'MediLife',
      'price': 5.00,
      'lastUpdated': '2024-01-13',
    },
    {
      'name': 'Cetrizine 10mg',
      'type': 'Tablet',
      'batchNumber': 'BT2024003',
      'currentStock': 300,
      'expiryDate': '2025-08-20',
      'manufacturer': 'HealthPharm',
      'price': 1.50,
      'lastUpdated': '2024-01-13',
    },
  ];

  Map<int, int> quantityChanges = {};

  Color getExpiryColor(String expiryDate) {
    final expiry = DateTime.parse(expiryDate);
    final now = DateTime.now();
    final difference = expiry.difference(now).inDays;

    if (difference < 0) {
      return Colors.red;
    } else if (difference < 90) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  void updateQuantity(int index, int amount) {
    setState(() {
      quantityChanges[index] = (quantityChanges[index] ?? 0) + amount;
      if ((medicineItems[index]['currentStock'] +
              (quantityChanges[index] ?? 0)) <
          0) {
        quantityChanges[index] = -medicineItems[index]['currentStock'];
      }
    });
  }

  void submitStockChanges() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Medicine Stock Update Summary'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quantityChanges.entries.map((entry) {
              final item = medicineItems[entry.key];
              final change = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Batch: ${item['batchNumber']}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Change: ${change > 0 ? '+' : ''}$change ${item['type']}s',
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
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement your stock update logic here
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Stock Entry'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: medicineItems.length,
              itemBuilder: (context, index) {
                final item = medicineItems[index];
                final currentChange = quantityChanges[index] ?? 0;
                final currentTotal = item['currentStock'] + currentChange;
                final expiryColor = getExpiryColor(item['expiryDate']);

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
                            Expanded(
                              child: Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(item['type']),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.business,
                                size: 16, color: Colors.grey[600]),
                            const SizedBox(width: 4),
                            Text(
                              item['manufacturer'],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
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
                              child: Text('Batch: ${item['batchNumber']}'),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: expiryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: expiryColor),
                              ),
                              child: Text(
                                'Exp: ${item['expiryDate']}',
                                style: TextStyle(color: expiryColor),
                              ),
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
                              style: const TextStyle(color: Colors.grey),
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
