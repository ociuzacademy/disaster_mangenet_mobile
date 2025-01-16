import 'package:cached_network_image/cached_network_image.dart';
import 'package:disaster_management/CampModule/MainHomePage/pages/camphomepage.dart';
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
  bool _isLoading = false; // Manage button loading state

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
        title: const Text("Request Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: ImageUrl + widget.image,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 40,
                    backgroundImage: imageProvider,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text("Age: ${widget.age}, Gender: ${widget.gender}"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Details Section
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address: ${widget.address}"),
                    const SizedBox(height: 8),
                    Text("Family Members: ${widget.family_members}"),
                    const SizedBox(height: 8),
                    Text("Contact: ${widget.contact}"),
                    const SizedBox(height: 8),
                    Text(
                        "Number of People Missing: ${widget.no_of_people_missing}"),
                    const SizedBox(height: 8),
                    Text("Missing Person Info: ${widget.missing_person_info}"),
                    const SizedBox(height: 8),
                    Text("Additional Info: ${widget.additional_info}"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Request Form Section
            const Text(
              "Request Your Need",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
                    hint: const Text("Choose an option"),
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
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 30),

                  // Submit Button with Loading
                  BlocListener<RequestServiceBloc, RequestServiceState>(
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loading: () {
                          setState(() {
                            _isLoading = true;
                          });
                        },
                        error: (error) {
                          setState(() {
                            _isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Error: $error"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        success: (response) {
                          setState(() {
                            _isLoading = false;
                          });
                          if (response.message ==
                              "Requirement successfully added") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Request submitted successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MainCampHomePage(),
                              ),
                            );
                            setState(() {
                              selectedNeed = null;
                              _noteController.clear();
                            });
                          }
                        },
                      );
                    },
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null // Disable the button when loading
                          : () {
                              if (_formKey.currentState!.validate()) {
                                requestServAPI();
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Send Request",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
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
    final requestServBloc = BlocProvider.of<RequestServiceBloc>(context);
    requestServBloc.add(RequestServiceEvent.requestServ(
      category: selectedNeed ?? '',
      description: _noteController.text.trim(),
      refugeeid: widget.id,
      camp: widget.camp,
    ));
  }
}
