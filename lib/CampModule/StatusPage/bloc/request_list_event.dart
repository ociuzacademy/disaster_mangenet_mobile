part of 'request_list_bloc.dart';

@freezed
class RequestListEvent with _$RequestListEvent {
  const factory RequestListEvent.started() = _Started;
  const factory RequestListEvent.requestList() = _RequestList;
}
