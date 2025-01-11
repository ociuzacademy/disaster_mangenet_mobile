part of 'camp_list_bloc.dart';

@freezed
class CampListState with _$CampListState {
  const factory CampListState.initial() = _Initial;
  const factory CampListState.loding() = _Loding;
  const factory CampListState.error({required String error}) = _Error;
  const factory CampListState.success({required CampslistModel response}) =
      _Success;
}
