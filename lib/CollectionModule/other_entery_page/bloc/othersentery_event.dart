part of 'othersentery_bloc.dart';

@freezed
class OthersenteryEvent with _$OthersenteryEvent {
  const factory OthersenteryEvent.started() = _Started;
  const factory OthersenteryEvent.othersEntery({
    required String item_category,
    required String item_name,
    required String quantity,
    required String unit_type,
  }) = _OthersEntery;
}
