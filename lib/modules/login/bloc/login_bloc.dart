import 'package:bloc/bloc.dart';
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
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('uid', response.data.first.id.toString());
            prefs.setString('utype', response.data.first.utype);
            prefs.setString(
                'collection_center_id', response.data.first.cId.toString());
            prefs.setString(
                'sectionID', response.data.first.sectionId.toString());
            prefs.setBool('alreadyLoginStatus', true);

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
