part of 'refugee_register_bloc.dart';

@freezed
class RefugeeRegisterState with _$RefugeeRegisterState {
  const factory RefugeeRegisterState.initial() = _Initial;
  const factory RefugeeRegisterState.loading() = _Loading;
  const factory RefugeeRegisterState.error({required String error}) = _Error;
  const factory RefugeeRegisterState.success(
      {required RefugeesregModel response}) = _Success;
}
