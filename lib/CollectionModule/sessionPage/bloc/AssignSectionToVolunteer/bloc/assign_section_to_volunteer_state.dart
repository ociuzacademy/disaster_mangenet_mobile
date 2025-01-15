part of 'assign_section_to_volunteer_bloc.dart';

@freezed
class AssignSectionToVolunteerState with _$AssignSectionToVolunteerState {
  const factory AssignSectionToVolunteerState.initial() = _Initial;
  const factory AssignSectionToVolunteerState.loding() = _Loding;
  const factory AssignSectionToVolunteerState.error({required String error}) =
      _Error;
  const factory AssignSectionToVolunteerState.success(
      {required AssignSectionToVolunteerModel response}) = _Success;
}
