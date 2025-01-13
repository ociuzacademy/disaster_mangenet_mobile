import 'package:disaster_management/CampModule/StatusPage/bloc/request_list_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/takeaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestListPage extends StatefulWidget {
  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  @override
  void initState() {
    super.initState();
    fetchRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests List"),
        centerTitle: true,
      ),
      body: BlocBuilder<RequestListBloc, RequestListState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox(),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(
                "An error occurred: $error",
                style: TextStyle(color: Colors.red),
              ),
            ),
            success: (response) {
              final requests = response.data;
              if (requests.isEmpty) {
                return Center(child: Text("No requests available."));
              }

              return ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  final status = request.status ?? '';

                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${request.refugeeName}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "ID: ${request.refugee}",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Need: ${request.category}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Note: ${request.description}",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 10),
                          BlocListener<TakeactionBloc, TakeactionState>(
                            listener: (context, state) {
                              state.when(
                                initial: () {
                                  // Initial state - no action needed
                                },
                                loading: () {
                                  // Loading state - no snackbar needed
                                },
                                error: (error) {
                                  // Show an error snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("An error occurred: $error"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                                success: (response) {
                                  // Show a success snackbar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("successfully!"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Status Indicator
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(status),
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
                                          takeactionAPI(request.id);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          "Take Action",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
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
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
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

  void fetchRequestList() {
    final requestListBloc = BlocProvider.of<RequestListBloc>(context);
    requestListBloc.add(
      RequestListEvent.requestList(),
    );
  }

  void takeactionAPI(int id) {
    final takeactionBloc = BlocProvider.of<TakeactionBloc>(context);
    takeactionBloc.add(
      TakeactionEvent.takeAction(
        primerykey: id.toString(),
      ),
    );
  }
}
