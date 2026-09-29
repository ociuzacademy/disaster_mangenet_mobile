part of 'stock_enter_bloc.dart';

@freezed
class StockEnterEvent with _$StockEnterEvent {
  const factory StockEnterEvent.started() = _Started;
  const factory StockEnterEvent.stockenter({
    required String item_name,
    required String clothing_size,
    required String clothing_gender,
    required String color,
    required String fabric_type,
    required String quantity,
    required String item_category,
  }) = _Stockenter;
}
