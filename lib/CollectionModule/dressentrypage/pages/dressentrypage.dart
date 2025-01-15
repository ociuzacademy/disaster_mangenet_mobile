import 'package:disaster_management/CollectionModule/dressentrypage/bloc/stock_enter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDressItemPage extends StatefulWidget {
  const AddDressItemPage({Key? key}) : super(key: key);

  @override
  State<AddDressItemPage> createState() => _AddDressItemPageState();
}

class _AddDressItemPageState extends State<AddDressItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _quantityController = TextEditingController();

  String _selectedSize = 'M';
  String _selectedColor = 'Black';
  String _selectedGender = 'Unisex';
  String _selectedFabric = 'Cotton';
  String _itemcategory = 'Dress';

  // Available options
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  final List<String> _colors = [
    'Black',
    'White',
    'Red',
    'Blue',
    'Green',
    'Purple',
    'Pink',
    'Yellow',
    'Orange',
    'Brown',
    'Grey'
  ];
  final List<String> _genders = ['Male', 'Female', 'Unisex'];
  final List<String> _fabrics = [
    'Cotton',
    'Silk',
    'Polyester',
    'Wool',
    'Denim'
  ];

  @override
  void dispose() {
    _itemNameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      stockenterAPI();
    }
  }

  void stockenterAPI() {
    final stockEnterBloc = BlocProvider.of<StockEnterBloc>(context);

    // Collect data from controllers and dropdowns
    final itemName = _itemNameController.text;
    final quantity = _quantityController.text;

    // Ensure quantity is not empty and valid
    if (quantity.isEmpty || int.tryParse(quantity) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid quantity')),
      );
      return;
    }

    // Trigger the API event with the collected data
    stockEnterBloc.add(
      StockEnterEvent.stockenter(
        clothing_gender: _selectedGender,
        clothing_size: _selectedSize,
        color: _selectedColor,
        fabric_type: _selectedFabric,
        item_name: itemName,
        item_category: _itemcategory,
        quantity: quantity,
      ),
    );

    // Optionally clear the form fields after submission
    _formKey.currentState!.reset();
    _itemNameController.clear();
    _quantityController.clear();
    setState(() {
      _selectedSize = 'M';
      _selectedColor = 'Black';
      _selectedGender = 'Unisex';
      _selectedFabric = 'Cotton';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Dress Item'),
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
                    labelText: 'Dress Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a dress name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedSize,
                  decoration: const InputDecoration(
                    labelText: 'Clothing Size',
                    border: OutlineInputBorder(),
                  ),
                  items: _sizes.map((String size) {
                    return DropdownMenuItem<String>(
                      value: size,
                      child: Text(size),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedSize = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: const InputDecoration(
                    labelText: 'Clothing Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: _genders.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedColor,
                  decoration: const InputDecoration(
                    labelText: 'Color',
                    border: OutlineInputBorder(),
                  ),
                  items: _colors.map((String color) {
                    return DropdownMenuItem<String>(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedColor = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedFabric,
                  decoration: const InputDecoration(
                    labelText: 'Fabric Type',
                    border: OutlineInputBorder(),
                  ),
                  items: _fabrics.map((String fabric) {
                    return DropdownMenuItem<String>(
                      value: fabric,
                      child: Text(fabric),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedFabric = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text(
                    'Add Dress Item',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
