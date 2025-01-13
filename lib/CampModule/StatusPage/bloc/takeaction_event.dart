part of 'takeaction_bloc.dart';

@freezed
class TakeactionEvent with _$TakeactionEvent {
  const factory TakeactionEvent.started() = _Started;
  const factory TakeactionEvent.takeAction({required String primerykey}) =
      _TakeAction;
}
