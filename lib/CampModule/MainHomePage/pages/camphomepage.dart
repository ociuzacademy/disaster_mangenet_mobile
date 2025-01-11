// widgets/custombottom_bar.dart
import 'package:disaster_management/CampModule/HomePage/pages/homepage.dart';
import 'package:disaster_management/CampModule/StatusPage/Pages/statuspage.dart';
import 'package:disaster_management/modules/sosmessage/services/sosmessageservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:geolocator/geolocator.dart';
import '../../../usermainpage/profile.dart';

class MainCampHomePage extends StatefulWidget {
  const MainCampHomePage({super.key});

  @override
  State<MainCampHomePage> createState() => _MainCampHomePageState();
}

class _MainCampHomePageState extends State<MainCampHomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // getLocation();
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
    // print('${position.latitude}, ${position.longitude}');
    final response = await SOSMessage(
        sosmessage: message,
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString());
    if (response == "SOS message sent successfully!") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("SOS email completed")),
      );
    }
  }

  int _selectedIndex = 0;
  String _sosMessage = '';
  TextEditingController sosmessagecontroller = TextEditingController();
  final List<Widget> _pages = [
    UserListPage(),
    RequestListPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const [
          "Home",
          "requestlist",
          "Profile",
        ],
        icons: const [
          Icons.home_outlined,
          Icons.add_ic_call_sharp,
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
