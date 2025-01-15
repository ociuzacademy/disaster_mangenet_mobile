import 'package:disaster_management/CampModule/HomePage/pages/homepage.dart';
import 'package:disaster_management/CampModule/StatusPage/Pages/statuspage.dart';
import 'package:disaster_management/CollectionModule/HomePage/pages/homepagecollection.dart';
import 'package:disaster_management/CollectionModule/entrypage/pages/dataentrypage.dart';
import 'package:disaster_management/CollectionModule/sessionPage/pages/sessionpage.dart';
import 'package:disaster_management/modules/campListPage/Pages/camplist.dart';
import 'package:disaster_management/modules/sosmessage/services/sosmessageservice.dart';
import 'package:disaster_management/usermainpage/profileSection/views/volunteercollection_profile.dart';
import 'package:disaster_management/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:geolocator/geolocator.dart';
import '../../../usermainpage/resource_finder.dart';
import '../../../usermainpage/saftey_guidlines.dart';
import '../../../usermainpage/profileSection/views/userprofile.dart';

class MainCollectionHomePage extends StatefulWidget {
  final String sectionID;
  const MainCollectionHomePage({
    super.key,
    required this.sectionID,
  });

  @override
  State<MainCollectionHomePage> createState() => _MainCollectionHomePageState();
}

class _MainCollectionHomePageState extends State<MainCollectionHomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void getLocation({required String message}) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied');
      return;
    } else if (permission == LocationPermission.denied) {
      print('Location permissions are denied');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    final response = await SOSMessage(
        sosmessage: message,
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString());
    if (response == "SOS message sent successfully!") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("SOS email completed")),
      );
    }
  }

  int _selectedIndex = 0;
  TextEditingController sosmessagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Dynamically decide the pages based on sectionID
    final List<Widget> _pages = widget.sectionID.isEmpty
        ? [
            SessionsPage(),
            EntryPage(),
            volunteerCollectionnProfile(),
          ]
        : [
            CollectionHomePage(),
            EntryPage(),
            volunteerCollectionnProfile(),
          ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const [
          "Home",
          "Request List",
          "Profile",
        ],
        icons: [
          Icons.home_outlined,
          Icons.add,
          Icons.person_off,
        ],
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 12.sp, // Responsive font size
        ),
        tabSize: 60.w, // Responsive tab size
        tabIconSize: 28.w, // Responsive icon size
        tabBarColor: const Color.fromARGB(255, 251, 219, 219),
        tabSelectedColor: Colors.red,
        tabIconSelectedSize: 28.w,
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
