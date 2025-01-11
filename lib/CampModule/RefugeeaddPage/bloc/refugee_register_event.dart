part of 'refugee_register_bloc.dart';

@freezed
class RefugeeRegisterEvent with _$RefugeeRegisterEvent {
  const factory RefugeeRegisterEvent.started() = _Started;
  const factory RefugeeRegisterEvent.refugeeResgi({
    required String name,
    required String image,
    required String age,
    required String gender,
    required String camp,
    required String medicines_used,
    required String address,
    required String family_members,
    required String contact,
    required String no_of_people_missing,
    required String missing_person_info,
    required String additional_info,
    required String volunteer,
    required String date_of_entry,
  }) = _RefugeeResgi;
}
