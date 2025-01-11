import 'package:disaster_management/CampModule/Registrartion/bloc/camp_list_bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/bloc/volunteerRegBloc/bloc/volunteer_reg_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../widgets/textfiled.dart';
import '../../../widgets/textfiled_addres.dart';
import '../../../modules/login/pages/login_page.dart';

class VolunteerRelifeCampReg extends StatefulWidget {
  const VolunteerRelifeCampReg({super.key});

  @override
  State<VolunteerRelifeCampReg> createState() => _VolunteerRelifeCampRegState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController phncontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();
TextEditingController aadharcontroller = TextEditingController();
TextEditingController descriptioncontroller = TextEditingController();
TextEditingController skillcontroller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();

class _VolunteerRelifeCampRegState extends State<VolunteerRelifeCampReg> {
  bool _isSecurePassword = true;
  bool _isLoading = false;

  String? selectedDistrict;
  String? selectedSubDistrict;
  String? selectedId;

  List<String> districts = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Palakkad',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 50, bottom: 20),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Volunteer \nRelife Camp Registration",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  controller: namecontroller,
                  labelText: 'Name',
                  suffix: Icon(Icons.person, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  controller: skillcontroller,
                  labelText: 'Skills',
                  suffix: Icon(Icons.person, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  controller: emailcontroller,
                  labelText: 'Email',
                  suffix: Icon(Icons.mail, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  controller: passcontroller,
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  controller: phncontroller,
                  labelText: 'Phone Number',
                  suffix: Icon(Icons.phone, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                TextFiledAddres(
                  controller: addresscontroller,
                  labelText: 'Address',
                  suffix: Icon(null, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: DropdownButton<String>(
                    value: selectedDistrict,
                    hint: Text('Select District'),
                    items: districts.map((String district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDistrict = newValue;
                        districtAPI(selectedDistrict);
                      });
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                BlocBuilder<CampListBloc, CampListState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        return SizedBox();
                      },
                      loding: () {
                        return Center(child: CircularProgressIndicator());
                      },
                      error: (error) {
                        return Center(child: Text('Error: $error'));
                      },
                      success: (response) {
                        // Create a map of sub-district names to IDs
                        final Map<String, String> subDistrictMap = {
                          for (var datum in response.data!)
                            datum.name ?? '': datum.id?.toString() ?? ''
                        };

                        final List<String> subDistricts =
                            subDistrictMap.keys.toList();

                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: DropdownButton<String>(
                            value: selectedSubDistrict,
                            hint: Text('Select Camp'),
                            items: subDistricts.map((String subDistrict) {
                              return DropdownMenuItem<String>(
                                value: subDistrict,
                                child: Text(subDistrict),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedSubDistrict = newValue;

                                // Get the ID of the selected sub-district
                                selectedId =
                                    subDistrictMap[selectedSubDistrict ?? ''];
                                print('Selected Sub-District ID: $selectedId');
                              });
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Aadhar card number',
                  controller: aadharcontroller,
                  suffix: Icon(Icons.payment, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                TextFiledAddres(
                  labelText: 'Skills and Experience',
                  controller: descriptioncontroller,
                  suffix: Icon(null, size: 20.sp),
                  obscureText: false,
                ),
                SizedBox(height: 20.h),
                BlocListener<VolunteerRegBloc, VolunteerRegState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loding: () => setState(() => _isLoading = true),
                      error: (error) {
                        setState(() => _isLoading = false);
                      },
                      success: (message) {
                        setState(() => _isLoading = false);
                        // showSnackBar('Registration Successful!');
                      },
                    );
                  },
                  child: SizedBox(
                    width: 1.sw * 0.8,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              volunteerRegAPI();
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isLoading
                            ? Colors.grey
                            : const Color.fromARGB(255, 228, 12, 12),
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
                          : Text('Submit',
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

  void districtAPI(String? selectedDistrict) {
    final districtBloc = BlocProvider.of<CampListBloc>(context);
    districtBloc.add(CampListEvent.campList(
      district: selectedDistrict ?? '',
    ));
  }

  void volunteerRegAPI() {
    final volunteerRegBloc = BlocProvider.of<VolunteerRegBloc>(context);
    volunteerRegBloc.add(VolunteerRegEvent.volunteerReg(
      district: selectedDistrict ?? '',
      aadhaar: aadharcontroller.text.trim(),
      address: addresscontroller.text.trim(),
      chooseCamp: selectedId ?? '',
      email: emailcontroller.text.trim(),
      name: namecontroller.text.trim(),
      password: passcontroller.text.trim(),
      phoneNumber: phncontroller.text.trim(),
      skillsExp: skillcontroller.text.trim(),
    ));
  }
}
