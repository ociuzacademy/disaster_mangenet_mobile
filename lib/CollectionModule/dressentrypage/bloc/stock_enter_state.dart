part of 'stock_enter_bloc.dart';

@freezed
class StockEnterState with _$StockEnterState {
  const factory StockEnterState.initial() = _Initial;
  const factory StockEnterState.loding() = _Loding;
  const factory StockEnterState.error({required String error}) = _Error;
  const factory StockEnterState.success({required StockEnterModel response}) =
      _Success;
}
