import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/model/takeAction_model.dart';
import 'package:disaster_management/CampModule/StatusPage/service/take_action_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'takeaction_event.dart';
part 'takeaction_state.dart';
part 'takeaction_bloc.freezed.dart';

class TakeactionBloc extends Bloc<TakeactionEvent, TakeactionState> {
  TakeactionBloc() : super(_Initial()) {
    on<TakeactionEvent>((event, emit) async {
      try {
        emit(const TakeactionState.loading());
        if (event is _$TakeActionImpl) {
          final response = await takeActionServ(
            primerykey: event.primerykey,
          );

          emit(TakeactionState.success(response: response));
        }
      } catch (e) {
        emit(TakeactionState.error(error: e.toString()));
      }
    });
  }
}
