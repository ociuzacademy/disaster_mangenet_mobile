import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
import 'package:disaster_management/CollectionModule/HomePage/service/food_list_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_lists_event.dart';
part 'stock_lists_state.dart';
part 'stock_lists_bloc.freezed.dart';

class StockListsBloc extends Bloc<StockListsEvent, StockListsState> {
  StockListsBloc() : super(_Initial()) {
    on<StockListsEvent>((event, emit) async {
      try {
        emit(const StockListsState.loding());
        if (event is _$StockListsImpl) {
          final response = await FoodListService(
            item_category: event.item_category,
          );

          emit(StockListsState.success(response: response));
        }
      } catch (e) {
        emit(StockListsState.error(error: e.toString()));
      }
    });
  }
}
