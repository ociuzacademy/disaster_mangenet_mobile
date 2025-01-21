import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/other_entery_page/model/others_entery_model.dart';
import 'package:disaster_management/CollectionModule/other_entery_page/service/others_enterService.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'othersentery_event.dart';
part 'othersentery_state.dart';
part 'othersentery_bloc.freezed.dart';

class OthersenteryBloc extends Bloc<OthersenteryEvent, OthersenteryState> {
  OthersenteryBloc() : super(_Initial()) {
    on<OthersenteryEvent>((event, emit) async {
      try {
        emit(const OthersenteryState.loading());
        if (event is _$OthersEnteryImpl) {
          final response = await OthersEnteryService(
            item_category: event.item_category,
            item_name: event.item_name,
            quantity: event.quantity,
            unit_type: event.unit_type,
          );

          emit(OthersenteryState.success(response: response));
        }
      } catch (e) {
        emit(OthersenteryState.error(error: e.toString()));
      }
    });
  }
}
