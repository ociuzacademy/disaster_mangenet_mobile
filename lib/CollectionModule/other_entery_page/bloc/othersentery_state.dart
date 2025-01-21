part of 'othersentery_bloc.dart';

@freezed
class OthersenteryState with _$OthersenteryState {
  const factory OthersenteryState.initial() = _Initial;
  const factory OthersenteryState.loading() = _Loading;
  const factory OthersenteryState.error({required String error}) = _Error;
  const factory OthersenteryState.success(
      {required OthersEnteryModel response}) = _Success;
}
