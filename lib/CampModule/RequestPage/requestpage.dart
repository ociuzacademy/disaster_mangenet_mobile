import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String age;
  final String gender;
  final String medicines_used;
  final String address;
  final String family_members;
  final String contact;
  final String no_of_people_missing;
  final String missing_person_info;
  final String additional_info;
//  final String date_of_entry;
  final String camp;
  final String volunteer;

  RequestPage({
    required this.id,
    required this.name,
    required this.image,
    required this.age,
    required this.gender,
    required this.medicines_used,
    required this.address,
    required this.family_members,
    required this.contact,
    required this.no_of_people_missing,
    required this.missing_person_info,
    required this.additional_info,
    //  required this.date_of_entry,
    required this.camp,
    required this.volunteer,
  });

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _noteController = TextEditingController();
  String? selectedNeed;

  final List<String> needs = [
    "Dress",
    "Medicine",
    "Medical Assistance",
    "Mental Help",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Your Need"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Dropdown for selecting the need
                Text(
                  "Select Your Need",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  hint: Text("Choose an option"),
                  value: selectedNeed,
                  onChanged: (value) {
                    setState(() {
                      selectedNeed = value;
                    });
                  },
                  items: needs.map((need) {
                    return DropdownMenuItem(
                      value: need,
                      child: Text(need),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? "Please select an option" : null,
                ),
                SizedBox(height: 20),
                // Note Input field
                Text(
                  "Add a Note",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _noteController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Write your note here...",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Note cannot be empty" : null,
                ),
                SizedBox(height: 30),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission logic here
                      final snackBar = SnackBar(
                        content: Text(
                          "Request Sent Successfully!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.teal,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // Clear the form after submission
                      setState(() {
                        selectedNeed = null;
                        _noteController.clear();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Send Request",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
