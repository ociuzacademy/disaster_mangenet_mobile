import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
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
                // Dropdown
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
                // Note Input
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
                      // Handle form submission
                      final snackBar = SnackBar(
                        content: Text(
                          "Request Sent Successfully!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.teal,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // Clear form
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
