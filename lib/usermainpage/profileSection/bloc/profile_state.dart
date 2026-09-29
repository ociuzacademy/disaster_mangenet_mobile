part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loding;
  const factory ProfileState.error({required String error}) = _Error;
  const factory ProfileState.usersuccess({required UserProfileModel response}) =
      _Usersuccess;
  const factory ProfileState.volunteerSuccess(
      {required UserProfileModel response}) = _VolunteerSuccess;
  const factory ProfileState.collectionVolentiSuccess(
      {required UserProfileModel response}) = _CollectionVolentiSuccess;
}
