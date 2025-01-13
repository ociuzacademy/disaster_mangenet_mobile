part of 'volunteer_collection_center_bloc.dart';

@freezed
class VolunteerCollectionCenterState with _$VolunteerCollectionCenterState {
  const factory VolunteerCollectionCenterState.initial() = _Initial;
  const factory VolunteerCollectionCenterState.loding() = _Loding;
  const factory VolunteerCollectionCenterState.error({required String error}) =
      _Error;
  const factory VolunteerCollectionCenterState.success(
      {required CampslistModel response}) = _Success;
}
