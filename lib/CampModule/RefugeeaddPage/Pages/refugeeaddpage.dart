import 'dart:io';

import 'package:disaster_management/CampModule/MainHomePage/pages/camphomepage.dart';
import 'package:disaster_management/CampModule/RefugeeaddPage/bloc/refugee_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RefugeeInfoPage extends StatefulWidget {
  @override
  _RefugeeInfoPageState createState() => _RefugeeInfoPageState();
}

class _RefugeeInfoPageState extends State<RefugeeInfoPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _familyController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _missingPeopleController =
      TextEditingController();
  final TextEditingController _missingInfoController = TextEditingController();
  final TextEditingController _additionalInfoController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refugee Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ? Icon(Icons.camera_alt,
                            size: 40, color: Colors.grey.shade700)
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _nameController,
                label: "Name of Refugee",
                hintText: "Enter refugee's name",
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _ageController,
                label: "Age",
                hintText: "Enter Age",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _genderController,
                label: "Gender",
                hintText: "Enter Gender",
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _medicineController,
                label: "Medicines Used",
                hintText: "Enter medicines used by the refugee",
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _addressController,
                label: "Address",
                hintText: "Enter refugee's address",
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _familyController,
                label: "Family Members",
                hintText: "Enter number of family members",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _contactController,
                label: "Contact",
                hintText: "Enter contact number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _missingPeopleController,
                label: "Number of People Missing",
                hintText: "Enter number of missing people, if any",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _missingInfoController,
                label: "Missing Person Info",
                hintText: "Provide details about missing persons",
                maxLines: 3,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _additionalInfoController,
                label: "Additional Information",
                hintText: "Add any additional information",
                maxLines: 3,
              ),
              SizedBox(height: 30),
              BlocConsumer<RefugeeRegisterBloc, RefugeeRegisterState>(
                listener: (context, state) {
                  state.when(
                    initial: () {},
                    loading: () {},
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $message')),
                      );
                    },
                    success: (response) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Submission Successful!')),
                      );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainCampHomePage(),
                        ),
                      );
                      _clearControllers();
                    },
                  );
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        refugeeRegAPI();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Submit Details",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refugeeRegAPI() {
    final refugeeRegBloc = BlocProvider.of<RefugeeRegisterBloc>(context);
    refugeeRegBloc.add(
      RefugeeRegisterEvent.refugeeResgi(
        name: _nameController.text.trim(),
        image: _selectedImage?.path ?? '',
        age: _ageController.text.trim(),
        gender: _genderController.text.trim(),
        camp: '9',
        medicines_used: _medicineController.text.trim(),
        address: _addressController.text.trim(),
        family_members: _familyController.text.trim(),
        contact: _contactController.text.trim(),
        no_of_people_missing: _missingPeopleController.text.trim(),
        missing_person_info: _missingInfoController.text.trim(),
        additional_info: _additionalInfoController.text.trim(),
        volunteer: '3',
        date_of_entry: '',
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? "$label cannot be empty" : null,
        ),
      ],
    );
  }

  void _clearControllers() {
    _nameController.clear();
    _medicineController.clear();
    _addressController.clear();
    _familyController.clear();
    _contactController.clear();
    _missingPeopleController.clear();
    _missingInfoController.clear();
    _additionalInfoController.clear();
  }
}
