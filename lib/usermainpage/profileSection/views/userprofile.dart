import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:disaster_management/modules/Sos_Update/Pages/sos_update.dart';
import 'package:disaster_management/usermainpage/profileSection/bloc/profile_bloc.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                final items = response.data;
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          color: Colors.grey,
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
                    const Divider(color: Colors.grey, thickness: 1),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SosUpdatePage(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.keyboard_arrow_right, size: 30),
                          SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Update Now',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                'Your email address update',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () async {
                        // Perform logout by clearing the SharedPreferences
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.clear(); 

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
      ProfileEvent.profileFetch(utype: 'user'),
    );
  }
}
