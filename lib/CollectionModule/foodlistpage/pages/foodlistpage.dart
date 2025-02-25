import 'package:disaster_management/CollectionModule/HomePage/bloc/stock_lists_bloc.dart';
import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
import 'package:disaster_management/CollectionModule/foodlistpage/bloc/qtyupdate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class StockEntryPage extends StatefulWidget {
  const StockEntryPage({Key? key}) : super(key: key);

  @override
  State<StockEntryPage> createState() => _StockEntryPageState();
}

class _StockEntryPageState extends State<StockEntryPage> {
  Map<int, TextEditingController> qtyControllers = {};
  Map<int, bool> cardLoadingStates = {};

  @override
  void initState() {
    FoodListAPI();
    super.initState();
  }

  @override
  void dispose() {
    clearControllers();
    super.dispose();
  }

  void clearControllers() {
    qtyControllers.forEach((key, controller) {
      controller.dispose();
    });
    qtyControllers.clear();
    cardLoadingStates.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food'),
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<StockListsBloc, StockListsState>(
              builder: (context, state) {
                return state.when(
                  initial: () {
                    return SizedBox();
                  },
                  loding: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error) {
                    return Center(
                        child: Text('Error: $error',
                            style: const TextStyle(color: Colors.red)));
                  },
                  success: (response) {
                    // Clear previous controllers before rebuilding the list
                    clearControllers();

                    List<Datum> stockItems = response.data;
                    return
                     ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: stockItems.length,
                      itemBuilder: (context, index) {
                        final item = stockItems[index];
                        final currentTotal = item.quantity;
                        final expiryColor =
                            getExpiryColor(item.dateReceived.toString());

                        // Initialize controllers and states
                        qtyControllers[index] = TextEditingController();
                        cardLoadingStates[index] = false;

                        return Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(item.itemCategory),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: expiryColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border:
                                              Border.all(color: expiryColor),
                                        ),
                                        child: Text(
                                          " Stock Updated Date : ${DateFormat('yyyy-MM-dd').format(
                                            DateTime.parse(
                                              item.dateReceived.toString(),
                                            ),
                                          )}",
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Total QTY : ${currentTotal}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 200,
                              top: 45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 60,
                                    child: TextField(
                                      controller: qtyControllers[index],
                                      decoration: const InputDecoration(
                                        labelText: 'Qty',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  BlocListener<QtyupdateBloc, QtyupdateState>(
                                    listener: (context, state) {
                                      state.when(
                                        initial: () {
                                          // Do nothing for initial state
                                        },
                                        loading: () {
                                          // Show loading indicator
                                        },
                                        error: (error) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text('Error: $error'),
                                          ));
                                        },
                                        success: (response) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Quantity updated successfully!'),
                                            ),
                                          );
                                          FoodListAPI();
                                        },
                                      );
                                    },
                                    child: Card(
                                      child: IconButton(
                                        onPressed: () {
                                          QtyUpdateAPI(
                                              item.id, qtyControllers[index]!);
                                        },
                                        color: Colors.red,
                                        icon: const Icon(Icons.send),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
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

  void QtyUpdateAPI(int id, TextEditingController qtycontroller) {
    final qtyupdateBloc = BlocProvider.of<QtyupdateBloc>(context);
    qtyupdateBloc.add(
      QtyupdateEvent.qtyupdate(
        stockid: id.toString(),
        unit: qtycontroller.text.trim(),
      ),
    );
  }

  void FoodListAPI() {
    final stockListsBloc = BlocProvider.of<StockListsBloc>(context);
    stockListsBloc.add(
      StockListsEvent.stockLists(item_category: 'Food'),
    );
  }

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
}
