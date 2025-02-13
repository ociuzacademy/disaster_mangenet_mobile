import 'package:cached_network_image/cached_network_image.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:disaster_management/usermainpage/profileSection/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class volunteerCollectionnProfile extends StatefulWidget {
  const volunteerCollectionnProfile({super.key});

  @override
  State<volunteerCollectionnProfile> createState() =>
      _volunteerCollectionnProfileState();
}

class _volunteerCollectionnProfileState
    extends State<volunteerCollectionnProfile> {
  @override
  void initState() {
    super.initState();
    userRegAPI(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initializing...')),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: $error',
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: () => userRegAPI(context),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              collectionVolentiSuccess: (response) {
                return const SizedBox();
              },
              volunteerSuccess: (response) {
                return const SizedBox();
              },
              usersuccess: (response) {
                // Assuming the response has a data property which is a list of user data
                final items = response.data;
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cached Network Image
                        CachedNetworkImage(
                          imageUrl: ImageUrl + items[0].image,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            radius: 40,
                            backgroundImage: imageProvider,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[0].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                items[0].email,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        await SharedPrefHelper.clearUserData();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.logout, size: 30),
                          SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Log Out',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Log out account',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey, thickness: 0.5),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  void userRegAPI(context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context);
    profileBloc.add(
      ProfileEvent.profileFetch(utype: 'volcc'),
    );
  }
}
