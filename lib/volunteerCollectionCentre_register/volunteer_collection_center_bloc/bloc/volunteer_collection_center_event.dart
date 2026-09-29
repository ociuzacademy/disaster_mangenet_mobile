part of 'volunteer_collection_center_bloc.dart';

@freezed
class VolunteerCollectionCenterEvent with _$VolunteerCollectionCenterEvent {
  const factory VolunteerCollectionCenterEvent.started() = _Started;
  const factory VolunteerCollectionCenterEvent.campList(
      {required String district}) = _CampList;
}
