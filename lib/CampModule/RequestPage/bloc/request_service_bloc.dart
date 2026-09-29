import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/RequestPage/model/request_model.dart';
import 'package:disaster_management/CampModule/RequestPage/service/request_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_service_event.dart';
part 'request_service_state.dart';
part 'request_service_bloc.freezed.dart';

class RequestServiceBloc
    extends Bloc<RequestServiceEvent, RequestServiceState> {
  RequestServiceBloc() : super(_Initial()) {
    on<RequestServiceEvent>((event, emit) async {
      try {
        emit(const RequestServiceState.loading());
        if (event is _$RequestServImpl) {
          final response = await requestServ(
            description: event.description,
            category: event.category,
            refugeeid: event.refugeeid,
            camp: event.camp,
          );

          emit(RequestServiceState.success(response: response));
        }
      } catch (e) {
        emit(RequestServiceState.error(error: e.toString()));
      }
    });
  }
}
