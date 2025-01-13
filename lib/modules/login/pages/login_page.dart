// pages/login_page.dart
import 'package:disaster_management/CampModule/MainHomePage/pages/camphomepage.dart';
import 'package:disaster_management/modules/login/bloc/login_bloc.dart';
import 'package:disaster_management/widgets/lg_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widgets/textfiled.dart';
import '../../user_registration/pages/user_reg_page.dart';
import '../../../volunteerCollectionCentre_register/pages/volunteer_collection_reg.dart';
import '../../../CampModule/Registrartion/pages/volunteer_relife_camp_reg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController usernamecontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
            child: Column(
              children: [
                SizedBox(
                    height: 180.h,
                    child: Image.asset("assets/images/login-img.png")),
                TextFiledWidget(
                  labelText: 'Email',
                  suffix: Icon(Icons.mail, size: 24.sp),
                  obscureText: false,
                  controller: usernamecontroller,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                  controller: passcontroller,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        print("Forgot Password tapped!");
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 1.sw, // 1.sw is equivalent to screen width
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loding: () {
                          // You can show a loading spinner here
                        },
                        error: (error) {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error: $error")),
                          );
                        },
                        success: (response) {
                          // Handle success response
                          if (response.data.first.utype == "User") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Success")),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainCampHomePage()));
                          }
                        },
                      );
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        String username = usernamecontroller.text.trim();
                        String password = passcontroller.text.trim();
                        LoginAPI(username, password);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 228, 12, 12),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        textStyle: TextStyle(fontSize: 16.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text("Don't have an account ?",
                    style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                SizedBox(height: 25.h),
                LGBtn(
                  text: 'Register in user',
                  targetPage: UserRegPage(),
                ),
                LGBtn(
                    text: 'volunteer in relif camp',
                    targetPage: VolunteerRelifeCampReg()),
                LGBtn(
                    text: 'volunteer in collection centre',
                    targetPage: VolunteerCollectionReg()),
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
          ? Icon(Icons.visibility, size: 24.sp)
          : Icon(Icons.visibility_off, size: 24.sp),
      color: Colors.black,
    );
  }

  void LoginAPI(String username, String password) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    loginBloc.add(LoginEvent.login(
      email: username,
      password: password,
    ));
  }
}
