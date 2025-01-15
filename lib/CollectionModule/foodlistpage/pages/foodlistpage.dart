import 'package:disaster_management/CollectionModule/HomePage/bloc/stock_lists_bloc.dart';
import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the StockItem class
class StockItem {
  final String itemName;
  final int quantity;
  final String clothingSize;
  final String unit;

  StockItem({
    required this.itemName,
    required this.quantity,
    required this.clothingSize,
    required this.unit,
  });
}

class StockEntryPage extends StatefulWidget {
  const StockEntryPage({Key? key}) : super(key: key);

  @override
  State<StockEntryPage> createState() => _StockEntryPageState();
}

class _StockEntryPageState extends State<StockEntryPage> {
  Map<int, int> quantityChanges = {};

  @override
  void initState() {
    super.initState();
    FoodListAPI();
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
            child: BlocBuilder<StockListsBloc, StockListsState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return Center(
                        child: Text('Welcome! Please load the stock.'));
                  },
                  loding: () {
                    return Center(child: CircularProgressIndicator());
                  },
                  error: (error) {
                    return Center(
                        child: Text('Error: $error',
                            style: TextStyle(color: Colors.red)));
                  },
                  success: (response) {
                    List<Datum> stockItems = response.data;
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: stockItems.length,
                      itemBuilder: (context, index) {
                        final item = stockItems[index];
                        final currentChange = quantityChanges[index] ?? 0;
                        final currentTotal = item.quantity + currentChange;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Name : ${item.itemName}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Current: $currentTotal:${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 60,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          labelText: 'Qty',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 12),
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Card(
                                      child: IconButton(
                                        onPressed: () {},
                                        color: Colors.red,
                                        icon: Icon(Icons.send),
                                      ),
                                    )
                                  ],
                                )
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
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {},
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

  // Method to trigger loading of stock data
  void FoodListAPI() {
    final stockListsBloc = BlocProvider.of<StockListsBloc>(context);
    stockListsBloc.add(
      StockListsEvent.stockLists(item_category: 'food'),
    );
  }
}
