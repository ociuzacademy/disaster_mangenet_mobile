import 'package:disaster_management/CampModule/StatusPage/bloc/request_list_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/takeaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestListPage extends StatefulWidget {
  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  TextEditingController _searchController = TextEditingController();
  List _filteredRequests = [];
  List _allRequests = [];

  @override
  void initState() {
    super.initState();
    fetchRequestList();
    _searchController.addListener(_filterRequests);
  }

  void _filterRequests() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredRequests = _allRequests
          .where((request) => request.refugeeName.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests List", style: TextStyle(fontSize: 16)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search by Name...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<RequestListBloc, RequestListState>(
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
                    if (_allRequests != response.data) {
                      _allRequests = response.data;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          _filterRequests();
                        });
                      });
                    }

                    if (_filteredRequests.isEmpty) {
                      return Center(child: Text("No requests available."));
                    }

                    return ListView.builder(
                      itemCount: _filteredRequests.length,
                      itemBuilder: (context, index) {
                        final request = _filteredRequests[index];
                        final status = request.status ?? '';

                        return Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${request.refugeeName}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
                                      initial: () {},
                                      loading: () {},
                                      error: (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "An error occurred: $error"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                      success: (response) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("Successfully!"),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        fetchRequestList();
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: _getStatusColor(status),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          status,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
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
                                                  color: Colors.teal),
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
          ),
        ],
      ),
    );
  }

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
    final requestListBloc =
        BlocProvider.of<RequestListBloc>(context, listen: false);
    requestListBloc.add(RequestListEvent.requestList());
  }

  void takeactionAPI(int id) {
    final takeactionBloc =
        BlocProvider.of<TakeactionBloc>(context, listen: false);
    takeactionBloc.add(TakeactionEvent.takeAction(primerykey: id.toString()));
  }
}
