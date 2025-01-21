import 'package:disaster_management/CollectionModule/medicineentrymodule/bloc/medicine_entery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  String _selectedType = 'Tablet';
  DateTime? _selectedDate;

  bool _isLoading = false; // Added state for loading

  final List<String> _medicineTypes = [
    'Tablet',
    'Capsule',
    'Syrup',
    'Injection',
    'Cream',
    'Ointment',
    'Drops',
    'Powder',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _expiryDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      _medicineEnteryApi();
    }
  }

  void _medicineEnteryApi() {
    final medicineEnteryBloc = BlocProvider.of<MedicineEnteryBloc>(context);
    medicineEnteryBloc.add(MedicineEnteryEvent.enteryMedicine(
      item_category: 'Medicine',
      item_name: _nameController.text.trim(),
      quantity: _quantityController.text.trim(),
      unit_type: _selectedType,
      medicine_expiry_date: _expiryDateController.text.trim(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Medicine'),
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
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Name *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter medicine name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine quantity *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter medicine quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Type *',
                    border: OutlineInputBorder(),
                  ),
                  items: _medicineTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _expiryDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date *',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select expiry date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                BlocListener<MedicineEnteryBloc, MedicineEnteryState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loading: () {
                        // Button's loading already handled by _isLoading
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
                              content: Text('Medicine added successfully!')),
                        );
                        _formKey.currentState?.reset();
                        _nameController.clear();
                        _quantityController.clear();
                        _expiryDateController.clear();
                        setState(() {
                          _selectedType = 'Tablet';
                          _selectedDate = null;
                        });
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
                            'Add Medicine',
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
