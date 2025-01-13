import 'package:cached_network_image/cached_network_image.dart';
import 'package:disaster_management/CampModule/RequestPage/bloc/request_service_bloc.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    "Special Request"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: ImageUrl + widget.image,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: Colors.red),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 40,
                    backgroundImage: imageProvider,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Age: ${widget.age}, Gender: ${widget.gender}"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Details Section
            Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address: ${widget.address}"),
                    SizedBox(height: 8),
                    Text("Family Members: ${widget.family_members}"),
                    SizedBox(height: 8),
                    Text("Contact: ${widget.contact}"),
                    SizedBox(height: 8),
                    Text(
                        "Number of People Missing: ${widget.no_of_people_missing}"),
                    SizedBox(height: 8),
                    Text("Missing Person Info: ${widget.missing_person_info}"),
                    SizedBox(height: 8),
                    Text("Additional Info: ${widget.additional_info}"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Request Form Section
            Text(
              "Request Your Need",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Dropdown for selecting the need
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
                        requestServAPI();
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
          ],
        ),
      ),
    );
  }

  void requestServAPI() {
    final RequestServBloc = BlocProvider.of<RequestServiceBloc>(context);
    RequestServBloc.add(RequestServiceEvent.requestServ(
      category: selectedNeed ?? '',
      description: _noteController.text.trim(),
      refugeeid: widget.id,
      camp: widget.camp,
    ));
  }
}
