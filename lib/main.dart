import 'package:disaster_management/CampModule/HomePage/bloc/user_list_bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/bloc/camp_list_bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/bloc/volunteerRegBloc/bloc/volunteer_reg_bloc.dart';
import 'package:disaster_management/CampModule/RequestPage/bloc/request_service_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/request_list_bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/bloc/takeaction_bloc.dart';
import 'package:disaster_management/modules/login/bloc/login_bloc.dart';
import 'package:disaster_management/modules/login/pages/login_page.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/bloc/collection_center_bloc.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/volunteer_collection_center_bloc/bloc/volunteer_collection_center_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CampModule/RefugeeaddPage/bloc/refugee_register_bloc.dart';

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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => CampListBloc()),
          BlocProvider(create: (context) => VolunteerRegBloc()),
          BlocProvider(create: (context) => RefugeeRegisterBloc()),
          BlocProvider(create: (context) => UserListBloc()),
          BlocProvider(create: (context) => RequestServiceBloc()),
          BlocProvider(create: (context) => RequestListBloc()),
          BlocProvider(create: (context) => VolunteerCollectionCenterBloc()),
          BlocProvider(create: (context) => CollectionCenterBloc()),
          BlocProvider(create: (context) => TakeactionBloc())
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: LoginPage(),
        ),
      ),
    );
  }
}
