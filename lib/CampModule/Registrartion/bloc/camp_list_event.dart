part of 'camp_list_bloc.dart';

@freezed
class CampListEvent with _$CampListEvent {
  const factory CampListEvent.started() = _Started;
  const factory CampListEvent.campList({required String district}) = _CampList;
}
