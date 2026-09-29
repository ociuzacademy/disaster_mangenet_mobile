part of 'collection_center_bloc.dart';

@freezed
class CollectionCenterEvent with _$CollectionCenterEvent {
  const factory CollectionCenterEvent.started() = _Started;
  const factory CollectionCenterEvent.collectionReg({
    required String email,
    required String password,
    required String choose_collection_center,
    required String name,
    required String address,
    required String aadhaar,
    required String district,
    required String phone_number,
  }) = _CollectionReg;
}
