import 'package:disaster_management/CollectionModule/sessionPage/bloc/AssignSectionToVolunteer/bloc/assign_section_to_volunteer_bloc.dart';
import 'package:disaster_management/CollectionModule/sessionPage/bloc/session_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({Key? key}) : super(key: key);

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  void initState() {
    super.initState();
    fetchSessionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sessions',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocConsumer<AssignSectionToVolunteerBloc,
                    AssignSectionToVolunteerState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loding: () {},
                      error: (error) {},
                      success: (response) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DetailPage(),
                        //   ),
                        // );
                      },
                    );
                  },
                  builder: (context, state) {
                    return BlocBuilder<SessionBloc, SessionState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const Center(
                              child: Text(
                            "No data available yet.",
                            style: TextStyle(fontSize: 16),
                          )),
                          loding: () => const Center(
                              child: CircularProgressIndicator(
                            color: Colors.blue,
                          )),
                          error: (error) => Center(
                              child: Text(
                            "Error: $error",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.red),
                          )),
                          success: (sessions) {
                            // Assuming sessions is a List<Map<String, dynamic>>
                            return ListView.builder(
                              itemCount: sessions.data.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        // Print the session's name and ID
                                        final session = sessions.data[index];
                                        print(
                                            'Session Name: ${session.sectionName}');
                                        print('Session ID: ${session.id}');
                                        SessionSelectionAPI(
                                            session.sectionName, session.id);
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              sessions.data[index].sectionName,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              sessions.data[index].id
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
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
        ),
      ),
    );
  }

  void fetchSessionData() {
    final sessionBloc = context.read<SessionBloc>();
    sessionBloc.add(SessionEvent.sessionList());
  }

  void SessionSelectionAPI(String sectionName, int id) {
    final assignSectionToVolunteerBloc =
        context.read<AssignSectionToVolunteerBloc>();
    assignSectionToVolunteerBloc.add(
      AssignSectionToVolunteerEvent.sessionSelection(
        sectionID: id.toString(),
      ),
    );
  }
}

// Detail Page for showing tapped session details
class DetailPage extends StatelessWidget {
  final String place;
  final String number;

  const DetailPage({
    Key? key,
    required this.place,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details for $place',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              'Session Number: $number',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
