part of 'volunteer_reg_bloc.dart';

@freezed
class VolunteerRegState with _$VolunteerRegState {
  const factory VolunteerRegState.initial() = _Initial;
  const factory VolunteerRegState.loding() = _Loding;
  const factory VolunteerRegState.error({required String error}) = _Error;
  const factory VolunteerRegState.success({required VolunteerModel response}) =
      _Success;
}
