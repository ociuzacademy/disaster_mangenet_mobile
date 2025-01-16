// widgets/custombottom_bar.dart
import 'package:disaster_management/modules/campListPage/Pages/camplist.dart';
import 'package:disaster_management/modules/sosmessage/services/sosmessageservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:geolocator/geolocator.dart';
import '../../collectioncamp/Pages/disaster_alert.dart';
import '../../HomePage/pages/homepage.dart';
import '../../../usermainpage/saftey_guidlines.dart';
import '../../../usermainpage/profileSection/views/userprofile.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
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
    HomePage(),
    //DisasterAlert(),
    CollectionListPage(),
    CampPage(),
    // ResourceFinder(),
    SafteyGuidlines(),
    Profile(),
  ];

  void _showSosDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Emergency SOS Message',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                'Accessing the Feature: Users can activate the SOS feature by tapping the red SOS button located at the bottom right corner of the app.',
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 30.h),
              TextField(
                controller: sosmessagecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your SOS message',
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 1.sw, // 1.sw is equivalent to screen width
                child: ElevatedButton(
                  onPressed: () =>
                      getLocation(message: sosmessagecontroller.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 12, 12),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    textStyle: TextStyle(fontSize: 16.sp),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: const [
          "Home",
          "Collectioncenter",
          "Camp",
          "Safety",
          "Profile",
        ],
        icons: const [
          Icons.home_outlined,
          Icons.collections_bookmark,
          Icons.campaign_outlined,
          Icons.search,
          Icons.person,
        ],
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
        ),
        tabSize: 60.w,
        tabIconSize: 28.w,
        tabBarColor: const Color.fromARGB(255, 251, 219, 219),
        tabSelectedColor: Colors.red,
        tabIconSelectedSize: 28.w,
        onTabItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSosDialog, // Show the SOS dialog
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.sos,
          color: Colors.white, // Icon color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
