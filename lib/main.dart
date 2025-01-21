import 'package:disaster_management/CampModule/HomePage/bloc/user_list_bloc.dart';
import 'package:disaster_management/CampModule/MainHomePage/pages/camphomepage.dart';
import 'package:disaster_management/CampModule/Registrartion/bloc/camp_list_bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/bloc/volunteerRegBloc/bloc/volunteer_reg_bloc.dart';
import 'package:disaster_management/CampModule/RequestPage/bloc/request_service_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/request_list_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/takeaction_bloc.dart';
import 'package:disaster_management/CollectionModule/HomePage/bloc/stock_lists_bloc.dart';
import 'package:disaster_management/CollectionModule/MainHomePage/pages/newhomepage.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/bloc/stock_enter_bloc.dart';
import 'package:disaster_management/CollectionModule/dresslistpage/bloc/dress_list_bloc.dart';
import 'package:disaster_management/CollectionModule/foodlistpage/bloc/qtyupdate_bloc.dart';
import 'package:disaster_management/CollectionModule/medicineentrymodule/bloc/medicine_entery_bloc.dart';
import 'package:disaster_management/CollectionModule/other_entery_page/bloc/othersentery_bloc.dart';
import 'package:disaster_management/CollectionModule/sessionPage/bloc/AssignSectionToVolunteer/bloc/assign_section_to_volunteer_bloc.dart';
import 'package:disaster_management/CollectionModule/sessionPage/bloc/session_bloc.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/modules/MainHomePage/pages/custombottom_bar.dart';
import 'package:disaster_management/modules/Sos_Update/bloc/sosupdate_bloc.dart';
import 'package:disaster_management/modules/login/bloc/login_bloc.dart';
import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:disaster_management/modules/user_registration/bloc/user_reg_bloc.dart';
import 'package:disaster_management/usermainpage/profileSection/bloc/profile_bloc.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/bloc/collection_center_bloc.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/volunteer_collection_center_bloc/bloc/volunteer_collection_center_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CampModule/RefugeeaddPage/bloc/refugee_register_bloc.dart';
import 'CollectionModule/foodentrypage/bloc/foodentery_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? logedIn;
  String? utype;

  @override
  void initState() {
    super.initState();
    logedin();
  }

  // Function to fetch login status and user type
  Future<void> logedin() async {
    logedIn = await fun().getlogin();
    utype = await fun().getutype();
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => UserRegBloc()),
          BlocProvider(create: (context) => CampListBloc()),
          BlocProvider(create: (context) => VolunteerRegBloc()),
          BlocProvider(create: (context) => RefugeeRegisterBloc()),
          BlocProvider(create: (context) => UserListBloc()),
          BlocProvider(create: (context) => RequestServiceBloc()),
          BlocProvider(create: (context) => RequestListBloc()),
          BlocProvider(create: (context) => VolunteerCollectionCenterBloc()),
          BlocProvider(create: (context) => CollectionCenterBloc()),
          BlocProvider(create: (context) => TakeactionBloc()),
          BlocProvider(create: (context) => SessionBloc()),
          BlocProvider(create: (context) => AssignSectionToVolunteerBloc()),
          BlocProvider(create: (context) => StockEnterBloc()),
          BlocProvider(create: (context) => FoodenteryBloc()),
          BlocProvider(create: (context) => StockListsBloc()),
          BlocProvider(create: (context) => DressListBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => SosupdateBloc()),
          BlocProvider(create: (context) => QtyupdateBloc()),
          BlocProvider(create: (context) => MedicineEnteryBloc()),
          BlocProvider(create: (context) => OthersenteryBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: logedIn == null
              ? const Center(child: CircularProgressIndicator())
              : utype == "user"
                  ? logedIn == true
                      ? const MainHomePage()
                      : const LoginPage()
                  : utype == "volcmp"
                      ? logedIn == true
                          ? const MainCampHomePage()
                          : const LoginPage()
                      : logedIn == true
                          ? const MainCollectionHomePage()
                          : const LoginPage(),
        ),
      ),
    );
  }
}
