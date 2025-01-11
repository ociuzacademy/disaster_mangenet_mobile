import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/models/camplistmodel.dart';
import 'package:disaster_management/CampModule/Registrartion/services/camplist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camp_list_event.dart';
part 'camp_list_state.dart';
part 'camp_list_bloc.freezed.dart';

class CampListBloc extends Bloc<CampListEvent, CampListState> {
  CampListBloc() : super(_Initial()) {
    on<CampListEvent>((event, emit) async {
      try {
        emit(const CampListState.loding());
        if (event is _$CampListImpl) {
          final response = await CampList(
            district: event.district,
          );

          emit(CampListState.success(response: response));
        }
      } catch (e) {
        emit(CampListState.error(error: e.toString()));
      }
    });
  }
}
