import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/models/volunteerreg_model.dart';
import 'package:disaster_management/CampModule/Registrartion/services/volunteerservice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_reg_event.dart';
part 'volunteer_reg_state.dart';
part 'volunteer_reg_bloc.freezed.dart';

class VolunteerRegBloc extends Bloc<VolunteerRegEvent, VolunteerRegState> {
  VolunteerRegBloc() : super(_Initial()) {
    on<VolunteerRegEvent>((event, emit) async {
      try {
        emit(const VolunteerRegState.loding());
        if (event is _$CampListImpl) {
          final response = await volunteerRegistration(
            district: event.district,
            aadhaar: event.aadhaar,
            address: event.address,
            chooseCamp: event.chooseCamp,
            email: event.email,
            name: event.name,
            password: event.password,
            phoneNumber: event.phoneNumber,
            skillsExp: event.skillsExp,
          );

          emit(VolunteerRegState.success(response: response));
        }
      } catch (e) {
        emit(VolunteerRegState.error(error: e.toString()));
      }
    });
  }
}
