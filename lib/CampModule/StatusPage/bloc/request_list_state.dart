part of 'request_list_bloc.dart';

@freezed
class RequestListState with _$RequestListState {
  const factory RequestListState.initial() = _Initial;
  const factory RequestListState.loading() = _Loading;
  const factory RequestListState.error({required String error}) = _Error;
  const factory RequestListState.success({required RequestListModel response}) =
      _Success;
}
