import 'package:disaster_management/CampModule/MainHomePage/pages/camphomepage.dart';
import 'package:disaster_management/CollectionModule/MainHomePage/pages/newhomepage.dart';
import 'package:disaster_management/CollectionModule/sessionPage/pages/sessionpage.dart';
import 'package:disaster_management/modules/MainHomePage/pages/custombottom_bar.dart';
import 'package:disaster_management/modules/login/bloc/login_bloc.dart';
import 'package:disaster_management/widgets/lg_btn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../widgets/textfiled.dart';
import '../../user_registration/pages/user_reg_page.dart';
import '../../../volunteerCollectionCentre_register/pages/volunteer_collection_reg.dart';
import '../../../CampModule/Registrartion/pages/volunteer_relife_camp_reg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isSecurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/images/login-img.png"),
                ),
                TextFiledWidget(
                  labelText: 'Email',
                  suffix: Icon(Icons.mail, size: 24.sp),
                  obscureText: false,
                  controller: usernameController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                  controller: passwordController,
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
                  width: 1.sw,
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      state.when(
                        initial: () {},
                        loding: () {
                          setState(() {
                            isLoading = true;
                          });
                        },
                        error: (error) {
                          setState(() {
                            isLoading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error ?? "An error occurred."),
                            ),
                          );
                        },
                        success: (response) async {
                          setState(() {
                            isLoading = false;
                          });
                          if (response.data.isNotEmpty &&
                              response.data[0].utype == "user") {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setInt('id', response.data[0].id);
                            await prefs.setBool(
                                'login', response.data[0].login);
                            await prefs.setString(
                                "utype", response.data[0].utype);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Success")),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainHomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } else if (response.data[0].utype == "volcmp") {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString(
                                'campid', response.data[0].cId);
                            await prefs.setInt('id', response.data[0].id);
                            await prefs.setBool(
                                'login', response.data[0].login);
                            await prefs.setString(
                                "utype", response.data[0].utype);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Success")),
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainCampHomePage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          } else {
                            if (response.data[0].sectionId.isNotEmpty) {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setString(
                                  'collectionid', response.data[0].cId);
                              await prefs.setInt('id', response.data[0].id);
                              await prefs.setBool(
                                  'login', response.data[0].login);
                              await prefs.setString(
                                  "utype", response.data[0].utype);
                              await prefs.setString(
                                  'sessionid', response.data[0].sectionId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Success")),
                              );

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainCollectionHomePage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login Success")),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SessionsPage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                          }
                        },
                      );
                    },
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              String username = usernameController.text.trim();
                              String password = passwordController.text.trim();

                              if (username.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Please fill in all fields.")),
                                );
                                return;
                              }
                              LoginAPI(username, password);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 228, 12, 12),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        textStyle: TextStyle(fontSize: 16.sp),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: isLoading
                          ? SpinKitRotatingCircle(
                              color: Colors.red, size: 24.sp)
                          : Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Don't have an account ?",
                  style: TextStyle(color: Colors.black, fontSize: 14.sp),
                ),
                SizedBox(height: 25.h),
                LGBtn(
                  text: 'Register as User',
                  targetPage: UserRegPage(),
                ),
                LGBtn(
                  text: 'Volunteer in Relief Camp',
                  targetPage: VolunteerRelifeCampReg(),
                ),
                LGBtn(
                  text: 'Volunteer in Collection Centre',
                  targetPage: VolunteerCollectionReg(),
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
