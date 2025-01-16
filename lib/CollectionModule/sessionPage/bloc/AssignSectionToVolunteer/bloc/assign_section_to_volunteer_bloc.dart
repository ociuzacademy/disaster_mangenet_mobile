import 'package:bloc/bloc.dart';
import 'package:disaster_management/CollectionModule/sessionPage/model/assignSectionToVolunteer_model.dart';
import 'package:disaster_management/CollectionModule/sessionPage/service/assignSectionToVolunteer_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'assign_section_to_volunteer_event.dart';
part 'assign_section_to_volunteer_state.dart';
part 'assign_section_to_volunteer_bloc.freezed.dart';

class AssignSectionToVolunteerBloc
    extends Bloc<AssignSectionToVolunteerEvent, AssignSectionToVolunteerState> {
  AssignSectionToVolunteerBloc() : super(_Initial()) {
    on<AssignSectionToVolunteerEvent>((event, emit) async {
      try {
        emit(const AssignSectionToVolunteerState.loding());
        if (event is _$SessionSelectionImpl) {
          final response = await assignSectionToVolunteer_ser(
            sectionID: event.sectionID,
          );

          emit(AssignSectionToVolunteerState.success(response: response));
        }
      } catch (e) {
        emit(AssignSectionToVolunteerState.error(error: e.toString()));
      }
    });
  }
}
