// main.dart
import 'package:disaster_management/modules/HomePage/pages/homepage.dart';
import 'package:disaster_management/modules/MainHomePage/pages/custombottom_bar.dart';
import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Add your Blocs or Cubits imports here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: const Size(375, 812), // Set your design size
      minTextAdapt: true, // Adjust text sizes
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: LoginPage(),
      ),
    );
  }
}
