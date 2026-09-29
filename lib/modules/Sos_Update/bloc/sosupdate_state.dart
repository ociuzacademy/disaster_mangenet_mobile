part of 'sosupdate_bloc.dart';

@freezed
class SosupdateState with _$SosupdateState {
  const factory SosupdateState.initial() = _Initial;
  const factory SosupdateState.loading() = _Loading;
  const factory SosupdateState.error({required String error}) = _Error;
  const factory SosupdateState.success({required Sosupdate response}) =
      _Success;
}
