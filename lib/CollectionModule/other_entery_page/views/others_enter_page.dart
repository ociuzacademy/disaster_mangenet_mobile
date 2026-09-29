import 'package:disaster_management/CollectionModule/other_entery_page/bloc/othersentery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OthersEnteryPage extends StatefulWidget {
  const OthersEnteryPage({Key? key}) : super(key: key);

  @override
  State<OthersEnteryPage> createState() => _OthersEnteryPageState();
}

class _OthersEnteryPageState extends State<OthersEnteryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _OthersEnteryAPI();
    }
  }

  void _OthersEnteryAPI() {
    final othersenteryBloc = BlocProvider.of<OthersenteryBloc>(context);
    othersenteryBloc.add(OthersenteryEvent.othersEntery(
      item_category: 'other',
      item_name: _nameController.text.trim(),
      quantity: _quantityController.text.trim(),
      unit_type: _typeController.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name Input Field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Item Name *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the item name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Quantity Input Field
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Quantity *',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the quantity';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Expiry Date Input Field
                TextFormField(
                  controller: _typeController,
                  decoration: const InputDecoration(
                    labelText: 'Item Type*',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select an expiry date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Submit Button with BlocListener
                BlocListener<OthersenteryBloc, OthersenteryState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loading: () {
                        // Already handled by _isLoading
                      },
                      error: (error) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $error')),
                        );
                      },
                      success: (response) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added successfully!'),
                          ),
                        );
                        _formKey.currentState?.reset();
                        _nameController.clear();
                        _quantityController.clear();
                        _typeController.clear();
                      },
                    );
                  },
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
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
}
