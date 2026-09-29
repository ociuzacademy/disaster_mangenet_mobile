import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:disaster_management/modules/user_registration/model/userRegmodel.dart';
import 'package:disaster_management/modules/user_registration/services/userreg_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_reg_event.dart';
part 'user_reg_state.dart';
part 'user_reg_bloc.freezed.dart';

class UserRegBloc extends Bloc<UserRegEvent, UserRegState> {
  UserRegBloc() : super(_Initial()) {
    on<UserRegEvent>((event, emit) async {
      try {
        emit(const UserRegState.loading());
        if (event is _$UserRegImpl) {
          final file = File(event.image);
          final response = await Registration(
            email: event.email,
            Password: event.Password,
            location: event.location,
            name: event.name,
            address: event.address,
            phonenumber: event.phonenumber,
            img: file,
          );

          emit(UserRegState.success(response: response));
        }
      } catch (e) {
        emit(UserRegState.error(error: e.toString()));
      }
    });
  }
}
