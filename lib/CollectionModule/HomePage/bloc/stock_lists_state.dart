part of 'stock_lists_bloc.dart';

@freezed
class StockListsState with _$StockListsState {
  const factory StockListsState.initial() = _Initial;
  const factory StockListsState.loding() = _Loding;
  const factory StockListsState.error({required String error}) = _Error;
  const factory StockListsState.success({required StockListsModel response}) =
      _Success;
}
