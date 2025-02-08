import 'package:cached_network_image/cached_network_image.dart'; // Import the package
import 'package:disaster_management/CampModule/HomePage/bloc/user_list_bloc.dart';
import 'package:disaster_management/CampModule/RefugeeaddPage/Pages/refugeeaddpage.dart';
import 'package:disaster_management/CampModule/RequestPage/views/requestpage.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    // Triggering API call to get user list
    UserListAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camp Refugee List'),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return SizedBox();
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
            error: (error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $error', style: TextStyle(color: Colors.red)),
                    ElevatedButton(
                      onPressed: UserListAPI,
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            },
            success: (response) {
              final userList = response;

              if (userList.data.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Refugee List. Add Refugee',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RefugeeInfoPage()),
                          );
                        },
                        child: Text('Add Refugee'),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: userList.data.length,
                itemBuilder: (context, index) {
                  final user = userList.data[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: ImageUrl + user.image,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          radius: 25,
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title: Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('ID: ${user.id}'),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RequestPage(
                              id: response.data[index].id.toString(),
                              name: response.data[index].name,
                              image: response.data[index].image,
                              age: response.data[index].age.toString(),
                              gender: response.data[index].gender,
                              medicines_used:
                                  response.data[index].medicinesUsed,
                              address: response.data[index].address,
                              family_members:
                                  response.data[index].familyMembers,
                              contact: response.data[index].contact,
                              no_of_people_missing:
                                  response.data[index].noOfPeopleMissing,
                              missing_person_info:
                                  response.data[index].missingPersonInfo,
                              additional_info:
                                  response.data[index].additionalInfo,
                              camp: response.data[index].camp.toString(),
                              volunteer:
                                  response.data[index].volunteer.toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RefugeeInfoPage()));
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // API Call to fetch user list
  void UserListAPI() {
    final userListBloc = BlocProvider.of<UserListBloc>(context);
    userListBloc.add(UserListEvent.userList());
  }
}
