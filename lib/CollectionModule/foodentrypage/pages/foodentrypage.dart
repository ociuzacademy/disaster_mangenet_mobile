import 'package:disaster_management/CollectionModule/MainHomePage/pages/newhomepage.dart';
import 'package:disaster_management/CollectionModule/foodentrypage/bloc/foodentery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFoodItemPage extends StatefulWidget {
  const AddFoodItemPage({Key? key}) : super(key: key);

  @override
  State<AddFoodItemPage> createState() => _AddFoodItemPageState();
}

class _AddFoodItemPageState extends State<AddFoodItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _currentStockController = TextEditingController();
  final _food_expiry_dateController = TextEditingController();
  String _selectedUnit = 'kg';
  String _item_type = 'Snacks';

  // List of available units
  final List<String> _units = ['kg', 'L', 'g', 'mL', 'pieces'];
  final List<String> _floodCampFoodCategories = [
    'Canned Foods',
    'Dry Goods',
    'Instant Meals',
    'Snacks',
    'Beverages',
    'Emergency Foods',
    'Perishable Foods',
    'Proteins',
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Low-Carb',
    'High-Protein',
    'Organic',
    'Fruits',
    'Vegetables',
    'Grains',
    'Breakfast Items',
    'Soups & Stews',
    'Energy Bars & Snacks',
    'Spices & Condiments',
    'Packaged Meals',
    'Instant Noodles',
    'Canned Meats',
    'Canned Vegetables',
    'Canned Fruits',
    'Ready-to-Eat Meals'
  ];

  @override
  void dispose() {
    _itemNameController.dispose();
    _currentStockController.dispose();
    _food_expiry_dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Food Item'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _itemNameController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.fastfood),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _currentStockController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Initial Stock',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.inventory),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter initial stock';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (int.parse(value) < 0) {
                            return 'Stock cannot be negative';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: DropdownButtonFormField<String>(
                        value: _selectedUnit,
                        decoration: const InputDecoration(
                          labelText: 'Unit',
                          border: OutlineInputBorder(),
                        ),
                        items: _units.map((String unit) {
                          return DropdownMenuItem<String>(
                              value: unit, child: Text(unit));
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedUnit = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _food_expiry_dateController,
                  decoration: const InputDecoration(
                    labelText: 'Food Expiry Date',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter food expiry date';
                    }
                    return null;
                  },
                  onTap: () async {
                    // Prevents the keyboard from appearing when tapping on the text field
                    FocusScope.of(context).requestFocus(FocusNode());

                    // Show the date picker
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (selectedDate != null) {
                      // Format the selected date and update the controller
                      final formattedDate =
                          "${selectedDate.toLocal()}".split(' ')[0];
                      _food_expiry_dateController.text = formattedDate;
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _item_type,
                  decoration: const InputDecoration(
                    labelText: 'Food Item Type',
                    border: OutlineInputBorder(),
                  ),
                  items: _floodCampFoodCategories.map((String type) {
                    return DropdownMenuItem<String>(
                        value: type, child: Text(type));
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _item_type = newValue;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null ||
                        !_floodCampFoodCategories.contains(value)) {
                      return 'Please select a valid food item type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocListener<FoodenteryBloc, FoodenteryState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loding: () {
                        CircularProgressIndicator();
                      },
                      error: (message) {
                        // Hide loading indicator
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                      },
                      success: (response) {
                        // Hide loading indicator
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Item added successfully!')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainCollectionHomePage(),
                          ),
                        );
                      },
                    );
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      _submitFormAPI(
                          _itemNameController,
                          _currentStockController,
                          _selectedUnit,
                          _item_type,
                          _food_expiry_dateController);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Add Item',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitFormAPI(
    TextEditingController itemNameController,
    TextEditingController currentStockController,
    String selectedUnit,
    String item_type,
    TextEditingController food_expiry_dateController,
  ) {
    final foodenteryBloc = BlocProvider.of<FoodenteryBloc>(context);
    foodenteryBloc.add(
      FoodenteryEvent.foodstockenter(
        food_expiry_date: food_expiry_dateController.text.trim(),
        item_name: itemNameController.text.trim(),
        item_type: item_type ?? '',
        quantity: currentStockController.text.trim(),
        unit_type: _selectedUnit ?? '',
      ),
    );
  }
}
