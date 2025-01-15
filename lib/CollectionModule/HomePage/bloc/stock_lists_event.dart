part of 'stock_lists_bloc.dart';

@freezed
class StockListsEvent with _$StockListsEvent {
  const factory StockListsEvent.started() = _Started;
  const factory StockListsEvent.stockLists({
    required String item_category,
  }) = _StockLists;
}
