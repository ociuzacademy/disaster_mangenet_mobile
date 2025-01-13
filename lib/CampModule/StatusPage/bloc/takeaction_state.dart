part of 'takeaction_bloc.dart';

@freezed
class TakeactionState with _$TakeactionState {
  const factory TakeactionState.initial() = _Initial;
  const factory TakeactionState.loading() = _Loading;
  const factory TakeactionState.error({required String error}) = _Error;
  const factory TakeactionState.success({required TakeActionModel response}) =
      _Success;
}
