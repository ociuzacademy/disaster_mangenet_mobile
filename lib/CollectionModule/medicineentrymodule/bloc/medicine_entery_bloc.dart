import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/medicineentrymodule/model/medicine_entery_model.dart';
import 'package:disaster_management/CollectionModule/medicineentrymodule/service/medicine_entery_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine_entery_event.dart';
part 'medicine_entery_state.dart';
part 'medicine_entery_bloc.freezed.dart';

class MedicineEnteryBloc
    extends Bloc<MedicineEnteryEvent, MedicineEnteryState> {
  MedicineEnteryBloc() : super(_Initial()) {
    on<MedicineEnteryEvent>((event, emit) async {
      try {
        emit(const MedicineEnteryState.loading());
        if (event is _$EnteryMedicineImpl) {
          final response = await MedicineEnteryService(
            item_category: event.item_category,
            item_name: event.item_name,
            medicine_expiry_date: event.medicine_expiry_date,
            quantity: event.quantity,
            unit_type: event.unit_type,
          );

          emit(MedicineEnteryState.success(response: response));
        }
      } catch (e) {
        emit(MedicineEnteryState.error(error: e.toString()));
      }
    });
  }
}
