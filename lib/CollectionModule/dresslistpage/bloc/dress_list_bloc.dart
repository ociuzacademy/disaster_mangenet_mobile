import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
import 'package:disaster_management/CollectionModule/HomePage/service/food_list_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dress_list_event.dart';
part 'dress_list_state.dart';
part 'dress_list_bloc.freezed.dart';

class DressListBloc extends Bloc<DressListEvent, DressListState> {
  DressListBloc() : super(_Initial()) {
    on<DressListEvent>((event, emit) async {
      try {
        emit(const DressListState.loding());
        if (event is _$StockListsImpl) {
          final response = await FoodListService(
            item_category: event.item_category,
          );

          emit(DressListState.success(response: response));
        }
      } catch (e) {
        emit(DressListState.error(error: e.toString()));
      }
    });
  }
}
