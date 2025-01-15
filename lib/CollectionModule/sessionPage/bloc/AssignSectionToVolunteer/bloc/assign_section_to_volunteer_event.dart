part of 'assign_section_to_volunteer_bloc.dart';

@freezed
class AssignSectionToVolunteerEvent with _$AssignSectionToVolunteerEvent {
  const factory AssignSectionToVolunteerEvent.started() = _Started;
  const factory AssignSectionToVolunteerEvent.sessionSelection(
      {required String sectionID}) = _SessionSelection;
}
