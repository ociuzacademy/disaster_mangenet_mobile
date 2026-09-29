part of 'qtyupdate_bloc.dart';

@freezed
class QtyupdateEvent with _$QtyupdateEvent {
  const factory QtyupdateEvent.started() = _Started;
  const factory QtyupdateEvent.qtyupdate({
    required String stockid,
    required String unit,
  }) = _Qtyupdate;
}
