import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/RefugeeaddPage/model/refugeesregModel.dart';
import 'package:disaster_management/CampModule/RefugeeaddPage/service/refugees_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refugee_register_event.dart';
part 'refugee_register_state.dart';
part 'refugee_register_bloc.freezed.dart';

class RefugeeRegisterBloc
    extends Bloc<RefugeeRegisterEvent, RefugeeRegisterState> {
  RefugeeRegisterBloc() : super(_Initial()) {
    on<RefugeeRegisterEvent>((event, emit) async {
      try {
        emit(const RefugeeRegisterState.loading());
        if (event is _$RefugeeResgiImpl) {
          final response = await refugeeserv(
            name: event.name,
            image: File(event.image),
            age: event.age,
            gender: event.gender,
            camp: event.camp,
            medicines_used: event.medicines_used,
            address: event.address,
            family_members: event.family_members,
            contact: event.contact,
            no_of_people_missing: event.no_of_people_missing,
            missing_person_info: event.missing_person_info,
            additional_info: event.additional_info,
            volunteer: event.volunteer,
            date_of_entry: event.date_of_entry,
          );

          emit(RefugeeRegisterState.success(response: response));
        }
      } catch (e) {
        emit(RefugeeRegisterState.error(error: e.toString()));
      }
    });
  }
}
