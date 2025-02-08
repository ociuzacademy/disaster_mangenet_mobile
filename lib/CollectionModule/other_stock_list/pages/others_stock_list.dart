import 'package:disaster_management/CollectionModule/foodlistpage/bloc/qtyupdate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disaster_management/CollectionModule/dresslistpage/bloc/dress_list_bloc.dart';
import 'package:intl/intl.dart';

class OtherStockEntryPage extends StatefulWidget {
  const OtherStockEntryPage({Key? key}) : super(key: key);

  @override
  State<OtherStockEntryPage> createState() => _OtherStockEntryPageState();
}

class _OtherStockEntryPageState extends State<OtherStockEntryPage> {
  Map<int, int> quantityChanges = {};
  List<TextEditingController> qtyControllers = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    othersStockList();
  }

  @override
  void dispose() {
    for (var controller in qtyControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void updateQuantity(int index, int amount, List<dynamic> items) {
    setState(() {
      quantityChanges[index] = (quantityChanges[index] ?? 0) + amount;
      if ((items[index]['currentStock'] + (quantityChanges[index] ?? 0)) < 0) {
        quantityChanges[index] = -items[index]['currentStock'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Stocks'),
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
                          onPressed: othersStockList,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                  success: (response) {
                    final items = response.data;
                    qtyControllers = List.generate(
                      items.length,
                      (index) => TextEditingController(),
                    );

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final currentChange = quantityChanges[index] ?? 0;
                        final currentTotal = item.quantity + currentChange;
                        final expiryColor =
                            getExpiryColor(item.dateReceived.toString());

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
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              " colour : ${item.color}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 2,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              " Size : ${item.clothingSize}",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
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
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        // $currentTotal :
                                        'In Stock : ${item.quantity}',
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
                              left: 210,
                              top: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 60,
                                    child: TextField(
                                      controller: qtyControllers[index],
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
                                  BlocListener<QtyupdateBloc, QtyupdateState>(
                                    listener: (context, state) {
                                      state.when(
                                        initial: () {},
                                        loading: () {},
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
                                          dispose();
                                          othersStockList();
                                        },
                                      );
                                    },
                                    child: Card(
                                      child: IconButton(
                                        onPressed: () {
                                          QtyUpdateAPI(
                                              item.id, qtyControllers[index]);
                                        },
                                        color: Colors.red,
                                        icon: Icon(Icons.send),
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

  void othersStockList() {
    final dressListBloc = BlocProvider.of<DressListBloc>(context);
    dressListBloc.add(DressListEvent.stockLists(item_category: 'other'));
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
