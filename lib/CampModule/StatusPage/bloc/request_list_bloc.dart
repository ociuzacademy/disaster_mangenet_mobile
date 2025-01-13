import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/StatusPage/model/requestlist_model.dart';
import 'package:disaster_management/CampModule/StatusPage/service/requestlist_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_list_event.dart';
part 'request_list_state.dart';
part 'request_list_bloc.freezed.dart';

class RequestListBloc extends Bloc<RequestListEvent, RequestListState> {
  RequestListBloc() : super(_Initial()) {
    on<RequestListEvent>((event, emit) async {
      try {
        emit(const RequestListState.loading());
        if (event is _$RequestListImpl) {
          final response = await RequestlistServ();

          emit(RequestListState.success(response: response));
        }
      } catch (e) {
        emit(RequestListState.error(error: e.toString()));
      }
    });
  }
}
