import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/Registrartion/models/camplistmodel.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/service/volunteer_collection_center_Service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer_collection_center_event.dart';
part 'volunteer_collection_center_state.dart';
part 'volunteer_collection_center_bloc.freezed.dart';

class VolunteerCollectionCenterBloc extends Bloc<VolunteerCollectionCenterEvent,
    VolunteerCollectionCenterState> {
  VolunteerCollectionCenterBloc() : super(_Initial()) {
    on<VolunteerCollectionCenterEvent>((event, emit) async {
      try {
        emit(const VolunteerCollectionCenterState.loding());
        if (event is _$CampListImpl) {
          final response = await volunteer_collection_center_Service(
            district: event.district,
          );

          emit(VolunteerCollectionCenterState.success(response: response));
        }
      } catch (e) {
        emit(VolunteerCollectionCenterState.error(error: e.toString()));
      }
    });
  }
}
