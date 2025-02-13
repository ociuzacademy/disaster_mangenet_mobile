import 'package:bloc/bloc.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/modules/login/model/login_model.dart';
import 'package:disaster_management/modules/login/service/login%20service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            // Save data to shared preferences
            await SharedPrefHelper.saveUserData(
              id: response.data[0].id,
              login: response.data[0].login,
              utype: response.data[0].utype,
              campid: response.data[0].cId,
              collectionid: response.data[0].cId,
              sessionid: response.data[0].sectionId,
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
