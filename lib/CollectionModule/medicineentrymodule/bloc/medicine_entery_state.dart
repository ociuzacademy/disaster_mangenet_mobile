part of 'medicine_entery_bloc.dart';

@freezed
class MedicineEnteryState with _$MedicineEnteryState {
  const factory MedicineEnteryState.initial() = _Initial;
  const factory MedicineEnteryState.loading() = _Loading;
  const factory MedicineEnteryState.error({required String error}) = _Error;
  const factory MedicineEnteryState.success(
      {required MedicineEnteryModel response}) = _Success;
}
