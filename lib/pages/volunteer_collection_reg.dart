// pages/volunteer_collection_reg.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/dropdown.dart';
import '../widgets/textfiled.dart';
import '../widgets/textfiled_addres.dart';
import '../modules/login/pages/login_page.dart';

class volunteerCollectionReg extends StatefulWidget {
  const volunteerCollectionReg({super.key});

  @override
  State<volunteerCollectionReg> createState() => _volunteerCollectionRegState();
}

// TextEditingController namecontroller = TextEditingController();
// TextEditingController emailcontroller = TextEditingController();
// TextEditingController phncontroller = TextEditingController();
// TextEditingController passcontroller = TextEditingController();
// TextEditingController usernamecontroller = TextEditingController();

class _volunteerCollectionRegState extends State<volunteerCollectionReg> {
  bool _isSecurePassword = true;
  bool _isLoading = false; // Loading state

  void _submitForm() async {
    setState(() {
      _isLoading = true; // Show loading spinner
    });

    // Simulate a network request (e.g., user registration)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false; // Hide loading spinner
    });

    // Navigate to LoginPage after successful registration
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Registration Successful")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 12,right: 12,top: 50,bottom: 20),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "volunteer\n in collection centre",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h), // Responsive height
                Text(
                  "On a Register / Sign Up form, what is the best copy for(Statistically proven if available)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp, // Responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h), // Responsive height
                TextFiledWidget(
                  labelText: 'Name',
                  suffix: Icon(Icons.person, size: 20.sp),
                  obscureText: false,
                  // controller: namecontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'User Name',
                  suffix: Icon(Icons.person, size: 20.sp),
                  obscureText: false,
                  // controller: usernamecontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Email',
                  suffix: Icon(Icons.mail, size: 20.sp),
                  obscureText: false,
                  // controller: emailcontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                  // controller: passcontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Phone Number',
                  suffix: Icon(Icons.phone, size: 20.sp),
                  obscureText: false,
                  // controller: phncontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledAddres(
                  labelText: 'Address',
                  suffix: Icon(null, size: 20.sp),
                  obscureText: false,
                  // controller: phncontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Aadhar card number',
                  suffix: Icon(Icons.payment, size: 20.sp),
                  obscureText: false,
                  // controller: phncontroller,
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 1.sw * 0.8,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _submitForm, // Disable button while loading
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
                            color: Colors.white, size: 24.sp) // Loading spinner
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
