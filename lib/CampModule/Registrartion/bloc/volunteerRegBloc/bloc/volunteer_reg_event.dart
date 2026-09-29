part of 'volunteer_reg_bloc.dart';

@freezed
class VolunteerRegEvent with _$VolunteerRegEvent {
  const factory VolunteerRegEvent.started() = _Started;
  const factory VolunteerRegEvent.volunteerReg({
    required String district,
    required String aadhaar,
    required String address,
    required String chooseCamp,
    required String email,
    required String name,
    required String password,
    required String phoneNumber,
    required String skillsExp,
  }) = _CampList;
}
