part of 'user_reg_bloc.dart';

@freezed
class UserRegEvent with _$UserRegEvent {
  const factory UserRegEvent.started() = _Started;
  const factory UserRegEvent.userReg({
    required String name,
    required String phonenumber,
    required String email,
    required String location,
    required String address,
    required String Password,
    required String image,
  }) = _UserReg;
}
