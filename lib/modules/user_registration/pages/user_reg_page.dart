// pages/user_reg_page.dart
import 'dart:async';

import 'package:disaster_management/services/userreg_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../widgets/textfiled.dart';
import '../../login/pages/login_page.dart';

class UserRegPage extends StatefulWidget {
  const UserRegPage({super.key});

  @override
  State<UserRegPage> createState() => _UserRegPageState();
}

class _UserRegPageState extends State<UserRegPage> {
  // Text Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController utypeController = TextEditingController();

  bool _isSecurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    locationController.dispose();
    imageController.dispose();
    phoneNumberController.dispose();
    utypeController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_validateForm()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final userData = {
      //'name': nameController.text,
      //'email': emailController.text,
      'password': passwordController.text,
      'address': addressController.text,
      //'location': locationController.text,
      'image': imageController.text,
      // 'phone_number': phoneNumberController.text,
      'utype': utypeController.text,
    };

    final response = await Registration(
      name: nameController.text,
      phonenumber: phoneNumberController.text,
      email: emailController.text,
      location: locationController.text,
      address: addressController.text,
      Password: passwordController.text,
    );
    if (response == "sss") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Success")),
      );
      Timer(
        Duration(seconds: 1),
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed")),
      );
    }
  }

  bool _validateForm() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            child: Column(
              children: [
                Text(
                  "User Registration",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Name',
                  suffix: Icon(Icons.person, size: 20.sp),
                  obscureText: false,
                  controller: nameController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Email',
                  suffix: Icon(Icons.email, size: 20.sp),
                  obscureText: false,
                  controller: emailController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                  controller: passwordController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Address',
                  suffix: Icon(Icons.home, size: 20.sp),
                  obscureText: false,
                  controller: addressController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Location',
                  suffix: Icon(Icons.location_on, size: 20.sp),
                  obscureText: false,
                  controller: locationController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Image URL',
                  suffix: Icon(Icons.image, size: 20.sp),
                  obscureText: false,
                  controller: imageController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Phone Number',
                  suffix: Icon(Icons.phone, size: 20.sp),
                  obscureText: false,
                  controller: phoneNumberController,
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 1.sw * 0.8,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 12, 12),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      textStyle: TextStyle(fontSize: 16.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: _isLoading
                        ? SpinKitRotatingCircle(
                            color: Colors.white, size: 24.sp)
                        : Text('Complete Profile',
                            style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility, size: 20.sp)
          : Icon(Icons.visibility_off, size: 20.sp),
      color: Colors.black,
    );
  }
}
