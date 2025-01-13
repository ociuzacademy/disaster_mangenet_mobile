part of 'request_service_bloc.dart';

@freezed
class RequestServiceEvent with _$RequestServiceEvent {
  const factory RequestServiceEvent.started() = _Started;
  const factory RequestServiceEvent.requestServ({
    required String category,
    required String description,
    required String refugeeid,
    required String camp,
  }) = _RequestServ;
}
