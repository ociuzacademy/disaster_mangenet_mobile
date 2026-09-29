part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loding() = _Loding;
  const factory LoginState.error({required String error}) = _Error;
  const factory LoginState.success({required LoginModel response}) = _Success;
}
