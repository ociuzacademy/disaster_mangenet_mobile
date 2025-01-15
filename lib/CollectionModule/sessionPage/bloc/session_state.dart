part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loding() = _Loding;
  const factory SessionState.error({required String error}) = _Error;
  const factory SessionState.success(
      {required CollectionCenterSectionsModel response}) = _Success;
}
