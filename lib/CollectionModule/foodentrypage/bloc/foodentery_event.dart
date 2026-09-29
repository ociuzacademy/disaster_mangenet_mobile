part of 'foodentery_bloc.dart';

@freezed
class FoodenteryEvent with _$FoodenteryEvent {
  const factory FoodenteryEvent.started() = _Started;
  const factory FoodenteryEvent.foodstockenter({
    required String item_name,
    required String item_type,
    required String quantity,
    required String unit_type,
    required String food_expiry_date,
  }) = _Foodstockenter;
}
