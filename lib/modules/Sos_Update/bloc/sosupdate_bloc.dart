import 'package:bloc/bloc.dart';
import 'package:disaster_management/modules/Sos_Update/Models/sosmodel.dart';
import 'package:disaster_management/modules/Sos_Update/Services/sos_update_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sosupdate_event.dart';
part 'sosupdate_state.dart';
part 'sosupdate_bloc.freezed.dart';

class SosupdateBloc extends Bloc<SosupdateEvent, SosupdateState> {
  SosupdateBloc() : super(_Initial()) {
    on<SosupdateEvent>((event, emit) async {
      try {
        emit(const SosupdateState.loading());
        if (event is _$StockListsImpl) {
          final response = await SOSupdate(
            email: event.email,
            secondaryemail: event.secondaryemail,
          );

          emit(SosupdateState.success(response: response));
        }
      } catch (e) {
        emit(SosupdateState.error(error: e.toString()));
      }
    });
  }
}
