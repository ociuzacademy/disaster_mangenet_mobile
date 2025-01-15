import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/model/stock_enter_model.dart';
import 'package:disaster_management/CollectionModule/dressentrypage/service/stock_enter_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_enter_event.dart';
part 'stock_enter_state.dart';
part 'stock_enter_bloc.freezed.dart';

class StockEnterBloc extends Bloc<StockEnterEvent, StockEnterState> {
  StockEnterBloc() : super(_Initial()) {
    on<StockEnterEvent>((event, emit) async {
      try {
        emit(const StockEnterState.loding());
        if (event is _$StockenterImpl) {
          final response = await dressStockService(
            clothing_gender: event.clothing_gender,
            clothing_size: event.clothing_size,
            color: event.color,
            fabric_type: event.fabric_type,
            item_name: event.item_name,
            quantity: event.quantity,
            item_category: event.item_category,
          );

          emit(StockEnterState.success(response: response));
        }
      } catch (e) {
        emit(StockEnterState.error(error: e.toString()));
      }
    });
  }
}
