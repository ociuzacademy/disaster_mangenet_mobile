import 'package:bloc/bloc.dart';
import 'package:disaster_management/app_localdata/isar_functions/isar_functions.dart';
import 'package:disaster_management/modules/login/model/login_model.dart';
import 'package:disaster_management/modules/login/service/login%20service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(const LoginState.loding());
        if (event is _Login) {
          // Call login service
          final response = await Login(
            email: event.email,
            password: event.password,
          );
          if (response.data.first.status == 'success') {
            IsarServices().saveUserData(
              uid: response.data.first.id.toString(),
              utype: response.data.first.utype,
              alreadyLoginStatus: true,
            );
            emit(LoginState.success(response: response));
          } else {
            emit(const LoginState.error(error: "Please try again"));
          }
        }
      } catch (e) {
        emit(LoginState.error(error: e.toString()));
      }
    });
  }
}
