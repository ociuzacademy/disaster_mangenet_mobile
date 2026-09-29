part of 'user_reg_bloc.dart';

@freezed
class UserRegState with _$UserRegState {
  const factory UserRegState.initial() = _Initial;
  const factory UserRegState.loading() = _Loding;
  const factory UserRegState.error({required String error}) = _Error;
  const factory UserRegState.success({required UserRegModel response}) =
      _Success;
}
