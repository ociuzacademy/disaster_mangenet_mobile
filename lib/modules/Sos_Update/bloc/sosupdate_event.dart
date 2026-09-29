part of 'sosupdate_bloc.dart';

@freezed
class SosupdateEvent with _$SosupdateEvent {
  const factory SosupdateEvent.started() = _Started;
  const factory SosupdateEvent.stockLists({
    required String email,
    required String secondaryemail,
  }) = _StockLists;
}
