import 'dart:io';
import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:disaster_management/modules/user_registration/bloc/user_reg_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/textfiled.dart';

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
  final TextEditingController phoneNumberController = TextEditingController();

  bool _isSecurePassword = true;
  bool _isLoading = false;
  File? _pickedImage;

  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    super.dispose();
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
                // CircleAvatar for profile image
                GestureDetector(
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      setState(() {
                        _pickedImage = File(pickedFile.path);
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Colors.grey[200],
                    backgroundImage:
                        _pickedImage != null ? FileImage(_pickedImage!) : null,
                    child: _pickedImage == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 40.sp,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 20.h),
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
                  labelText: 'Phone Number',
                  suffix: Icon(Icons.phone, size: 20.sp),
                  obscureText: false,
                  controller: phoneNumberController,
                ),
                SizedBox(height: 30.h),
                BlocListener<UserRegBloc, UserRegState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loading: () {
                        setState(() {
                          _isLoading = true;
                        });
                      },
                      error: (error) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error)),
                        );
                      },
                      success: (response) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Registration Successful')),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    width: 1.sw * 0.8,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              setState(() {
                                _isLoading = true;
                              });
                              userRegAPI();
                            },
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

  void userRegAPI() {
    final imagePath = _pickedImage != null ? _pickedImage!.path : '';
    final userRegBloc = BlocProvider.of<UserRegBloc>(context);
    userRegBloc.add(
      UserRegEvent.userReg(
        Password: passwordController.text,
        address: addressController.text,
        email: emailController.text,
        location: locationController.text,
        name: nameController.text,
        phonenumber: phoneNumberController.text,
        image: imagePath,
      ),
    );
  }
}
