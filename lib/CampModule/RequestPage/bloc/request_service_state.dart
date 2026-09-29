part of 'request_service_bloc.dart';

@freezed
class RequestServiceState with _$RequestServiceState {
  const factory RequestServiceState.initial() = _Initial;
  const factory RequestServiceState.loading() = _Loading;
  const factory RequestServiceState.error({required String error}) = _Error;
  const factory RequestServiceState.success({required RequestModel response}) =
      _Success;
}
