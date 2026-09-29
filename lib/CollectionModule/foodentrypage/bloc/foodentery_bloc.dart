import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/model/stock_enter_model.dart';
import 'package:disaster_management/CollectionModule/foodentrypage/service/foodentery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodentery_event.dart';
part 'foodentery_state.dart';
part 'foodentery_bloc.freezed.dart';

class FoodenteryBloc extends Bloc<FoodenteryEvent, FoodenteryState> {
  FoodenteryBloc() : super(_Initial()) {
    on<FoodenteryEvent>((event, emit) async {
      try {
        emit(const FoodenteryState.loding());
        if (event is _$FoodstockenterImpl) {
          final response = await foodStockService(
            item_name: event.item_name,
            item_type: event.item_type,
            quantity: event.quantity,
            unit_type: event.unit_type,
            food_expiry_date: event.food_expiry_date,
          );

          emit(FoodenteryState.success(response: response));
        }
      } catch (e) {
        emit(FoodenteryState.error(error: e.toString()));
      }
    });
  }
}
