import 'package:flutter/material.dart';

class RequestListPage extends StatelessWidget {
  // Dummy data for requests
  final List<Map<String, String>> requests = [
    {"need": "Dress", "note": "Need warm clothes", "status": "Pending"},
    {"need": "Medicine", "note": "Paracetamol needed urgently", "status": "Approved"},
    {"need": "Medical Assistance", "note": "Need a doctor for checkup", "status": "Completed"},
    {"need": "Mental Help", "note": "Looking for a counselor", "status": "Pending"},
    {"need": "Medicine", "note": "Diabetes medication required", "status": "Approved"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          final status = request['status'];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Need: ${request['need']}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Note: ${request['note']}",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Status Indicator
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _getStatusColor(status!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Action Button or Banner
                      status == "Approved"
                          ? ElevatedButton(
                              onPressed: () {
                                // Handle action for the approved status
                                final snackBar = SnackBar(
                                  content: Text(
                                    "Request action performed!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Take Action"),
                            )
                          : Text(
                              status == "Completed"
                                  ? "Completed!"
                                  : "Awaiting Approval...",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Approved":
        return Colors.blue;
      case "Completed":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
