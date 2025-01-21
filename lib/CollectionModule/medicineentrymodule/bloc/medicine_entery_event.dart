part of 'medicine_entery_bloc.dart';

@freezed
class MedicineEnteryEvent with _$MedicineEnteryEvent {
  const factory MedicineEnteryEvent.started() = _Started;
  const factory MedicineEnteryEvent.enteryMedicine({
    required String item_category,
    required String item_name,
    required String quantity,
    required String unit_type,
    required String medicine_expiry_date,
  }) = _EnteryMedicine;
}
