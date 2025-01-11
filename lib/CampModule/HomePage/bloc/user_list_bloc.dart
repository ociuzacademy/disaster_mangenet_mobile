import 'package:bloc/bloc.dart';
import 'package:disaster_management/CampModule/HomePage/model/userList_model.dart';
import 'package:disaster_management/CampModule/HomePage/service/userList_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(_Initial()) {
    on<UserListEvent>((event, emit) async {
      try {
        emit(const UserListState.loading());
        if (event is _$UserListImpl) {
          final response = await UserListSer();

          emit(UserListState.success(response: response));
        }
      } catch (e) {
        emit(UserListState.error(error: e.toString()));
      }
    });
  }
}
