import 'package:bloc/bloc.dart';
import 'package:disaster_management/usermainpage/profileSection/models/userprofile_model.dart';
import 'package:disaster_management/usermainpage/profileSection/service/profilefetch_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(_Initial()) {
    on<ProfileEvent>((event, emit) async {
      try {
        emit(const ProfileState.loading());
        if (event is _$ProfileFetchImpl) {
          final response = await ProfileFetchService(
            utype: event.utype,
          );

          emit(ProfileState.usersuccess(response: response));
        }
      } catch (e) {
        emit(ProfileState.error(error: e.toString()));
      }
    });
  }
}
