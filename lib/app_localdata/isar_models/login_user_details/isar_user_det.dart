// app_localdata/isar_models/login_user_details/isar_user_det.dart
import 'package:isar/isar.dart';

part 'isar_user_det.g.dart';

@collection
class UserModel {
  Id id = 1;

  String? uid;

  String? utype;

  bool? alreadyLoginStatus;

  bool? allReadyRegistered;
}
