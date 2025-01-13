part of 'collection_center_bloc.dart';

@freezed
class CollectionCenterState with _$CollectionCenterState {
  const factory CollectionCenterState.initial() = _Initial;
  const factory CollectionCenterState.loding() = _Loding;
  const factory CollectionCenterState.error({required String error}) = _Error;
  const factory CollectionCenterState.success(
      {required VolunteerRegCollectionModel response}) = _Success;
}
