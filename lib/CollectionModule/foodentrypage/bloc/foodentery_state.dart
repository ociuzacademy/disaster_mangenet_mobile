part of 'foodentery_bloc.dart';

@freezed
class FoodenteryState with _$FoodenteryState {
  const factory FoodenteryState.initial() = _Initial;
  const factory FoodenteryState.loding() = _Loding;
  const factory FoodenteryState.error({required String error}) = _Error;
  const factory FoodenteryState.success({required StockEnterModel response}) =
      _Success;
}
