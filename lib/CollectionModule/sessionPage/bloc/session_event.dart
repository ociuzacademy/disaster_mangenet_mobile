part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.started() = _Started;
  const factory SessionEvent.sessionList() = _SessionList;
}
