import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/bloc/stock_enter_bloc.dart';
import 'package:disaster_management/CollectionModule/dresslistpage/bloc/dress_list_bloc.dart';

class DressStockEntryPage extends StatefulWidget {
  const DressStockEntryPage({Key? key}) : super(key: key);

  @override
  State<DressStockEntryPage> createState() => _DressStockEntryPageState();
}

class _DressStockEntryPageState extends State<DressStockEntryPage> {
  // Map to track quantity changes
  Map<int, int> quantityChanges = {};

  @override
  void initState() {
    super.initState();
    // Initiate API call to fetch dress items
    fetchDressList();
  }

  void fetchDressList() {
    final dressListBloc = BlocProvider.of<DressListBloc>(context);
    dressListBloc.add(DressListEvent.stockLists(item_category: 'dress'));
  }

  void updateQuantity(int index, int amount, List<dynamic> items) {
    setState(() {
      quantityChanges[index] = (quantityChanges[index] ?? 0) + amount;

      // Ensure stock doesn't go below 0
      if ((items[index]['currentStock'] + (quantityChanges[index] ?? 0)) < 0) {
        quantityChanges[index] = -items[index]['currentStock'];
      }
    });
  }

  void submitStockChanges(List<dynamic> items) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stock Update Summary'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: quantityChanges.entries.map((entry) {
              final item = items[entry.key];
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
            child: BlocBuilder<DressListBloc, DressListState>(
              builder: (context, state) {
                return state.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loding: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Failed to fetch data.'),
                        Text(error, style: const TextStyle(color: Colors.red)),
                        ElevatedButton(
                          onPressed: fetchDressList,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  success: (response) {
                    final items =
                        response.data; // Assuming response.data is a List
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final currentChange = quantityChanges[index] ?? 0;
                        // final currentTotal = item['currentStock'] + currentChange;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.itemName,
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
                                      child: Text('Size: ${item.clothingSize}'),
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
                                      child: Text('Color: ${item.color}'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price: ₹${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // Text(
                                    //   'In Stock: $currentTotal',
                                    //   style: const TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Last Updated: ${item.clothingSize}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              updateQuantity(index, -1, items),
                                          icon: const Icon(
                                              Icons.remove_circle_outline),
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
                                          onPressed: () =>
                                              updateQuantity(index, 1, items),
                                          icon: const Icon(
                                              Icons.add_circle_outline),
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
                    );
                  },
                );
              },
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   child: ElevatedButton(
          //     onPressed: quantityChanges.isNotEmpty
          //         ? () => submitStockChanges(response.data)
          //         : null,
          //     style: ElevatedButton.styleFrom(
          //       minimumSize: const Size.fromHeight(50),
          //     ),
          //     child: const Text(
          //       'Submit Stock Changes',
          //       style: TextStyle(fontSize: 16),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
