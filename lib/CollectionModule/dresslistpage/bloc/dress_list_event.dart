part of 'dress_list_bloc.dart';

@freezed
class DressListEvent with _$DressListEvent {
  const factory DressListEvent.started() = _Started;
  const factory DressListEvent.stockLists({
    required String item_category,
  }) = _StockLists;
}
