part of 'dress_list_bloc.dart';

@freezed
class DressListState with _$DressListState {
  const factory DressListState.initial() = _Initial;
  const factory DressListState.loding() = _Loding;
  const factory DressListState.error({required String error}) = _Error;
  const factory DressListState.success({required StockListsModel response}) =
      _Success;
}
