import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/sessionPage/model/session_model.dart';
import 'package:disaster_management/CollectionModule/sessionPage/service/session_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(_Initial()) {
    on<SessionEvent>((event, emit) async {
      try {
        emit(const SessionState.loding());
        if (event is _$SessionListImpl) {
          final response = await SessionService();

          emit(SessionState.success(response: response));
        }
      } catch (e) {
        emit(SessionState.error(error: e.toString()));
      }
    });
  }
}
