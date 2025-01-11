import 'package:flutter/material.dart';

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
  final TextEditingController _missingPeopleController = TextEditingController();
  final TextEditingController _missingInfoController = TextEditingController();
  final TextEditingController _additionalInfoController = TextEditingController();

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
              // Refugee Name
              _buildTextField(
                controller: _nameController,
                label: "Name of Refugee",
                hintText: "Enter refugee's name",
              ),
              SizedBox(height: 15),

              // Medicines Used
              _buildTextField(
                controller: _medicineController,
                label: "Medicines Used",
                hintText: "Enter medicines used by the refugee",
              ),
              SizedBox(height: 15),

              // Address
              _buildTextField(
                controller: _addressController,
                label: "Address",
                hintText: "Enter refugee's address",
              ),
              SizedBox(height: 15),

              // Family Members
              _buildTextField(
                controller: _familyController,
                label: "Family Members",
                hintText: "Enter number of family members",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              // Contact Details
              _buildTextField(
                controller: _contactController,
                label: "Contact",
                hintText: "Enter contact number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 15),

              // Number of People Missing
              _buildTextField(
                controller: _missingPeopleController,
                label: "Number of People Missing",
                hintText: "Enter number of missing people, if any",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 15),

              // Information About Missing People
              _buildTextField(
                controller: _missingInfoController,
                label: "Missing Person Info",
                hintText: "Provide details about missing persons",
                maxLines: 3,
              ),
              SizedBox(height: 15),

              // Additional Information
              _buildTextField(
                controller: _additionalInfoController,
                label: "Additional Information",
                hintText: "Add any additional information",
                maxLines: 3,
              ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Collect data and handle submission
                    final refugeeData = {
                      "name": _nameController.text,
                      "medicines": _medicineController.text,
                      "address": _addressController.text,
                      "familyMembers": _familyController.text,
                      "contact": _contactController.text,
                      "missingCount": _missingPeopleController.text,
                      "missingInfo": _missingInfoController.text,
                      "additionalInfo": _additionalInfoController.text,
                    };

                    // Clear form and show confirmation
                    _formKey.currentState!.reset();
                    _clearControllers();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Refugee information submitted successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
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
                    "Submit Information",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields
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

  // Helper method to clear all controllers
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