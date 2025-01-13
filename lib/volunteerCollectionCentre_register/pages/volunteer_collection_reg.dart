import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/bloc/collection_center_bloc.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/volunteer_collection_center_bloc/bloc/volunteer_collection_center_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/textfiled.dart';
import '../../widgets/textfiled_addres.dart';

class VolunteerCollectionReg extends StatefulWidget {
  const VolunteerCollectionReg({super.key});

  @override
  State<VolunteerCollectionReg> createState() => _VolunteerCollectionRegState();
}

class _VolunteerCollectionRegState extends State<VolunteerCollectionReg> {
  bool _isSecurePassword = true;
  bool _isLoading = false;

  // Controllers for the input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();

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
  void dispose() {
    // Dispose controllers to free memory
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _aadharController.dispose();
    super.dispose();
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
                  "Volunteer\n in Collection Centre",
                  textAlign: TextAlign.center,
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
                  controller: _nameController,
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
                BlocBuilder<VolunteerCollectionCenterBloc,
                    VolunteerCollectionCenterState>(
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
                  labelText: 'Email',
                  suffix: Icon(Icons.mail, size: 20.sp),
                  obscureText: false,
                  controller: _emailController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Password',
                  suffix: togglePassword(),
                  obscureText: _isSecurePassword,
                  controller: _passwordController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Phone Number',
                  suffix: Icon(Icons.phone, size: 20.sp),
                  obscureText: false,
                  controller: _phoneController,
                ),
                SizedBox(height: 20.h),
                TextFiledAddres(
                  labelText: 'Address',
                  suffix: Icon(null, size: 20.sp),
                  obscureText: false,
                  controller: _addressController,
                ),
                SizedBox(height: 20.h),
                TextFiledWidget(
                  labelText: 'Aadhar Card Number',
                  suffix: Icon(Icons.payment, size: 20.sp),
                  obscureText: false,
                  controller: _aadharController,
                ),
                SizedBox(height: 20.h),
                BlocListener<CollectionCenterBloc, CollectionCenterState>(
                  listener: (context, state) {
                    state.when(
                      initial: () {},
                      loding: () {
                        setState(() {
                          _isLoading = true;
                        });
                      },
                      error: (error) {
                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $error')),
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
                      onPressed: () {
                        collectionCenterAPI();
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

  void districtAPI(String? selectedDistrict) {
    final districtBloc =
        BlocProvider.of<VolunteerCollectionCenterBloc>(context);
    districtBloc.add(VolunteerCollectionCenterEvent.campList(
      district: selectedDistrict ?? '',
    ));
  }

  void collectionCenterAPI() {
    final collectioncenterBloc = BlocProvider.of<CollectionCenterBloc>(context);
    collectioncenterBloc.add(CollectionCenterEvent.collectionReg(
      aadhaar: _aadharController.text,
      address: _addressController.text,
      choose_collection_center: selectedId ?? '',
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
      phone_number: _phoneController.text,
      district: selectedDistrict ?? '',
    ));
  }
}
