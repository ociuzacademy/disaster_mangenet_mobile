// app_localdata/isar_functions/isar_functions.dart
import 'dart:io';
import 'package:disaster_management/app_localdata/isar_models/login_user_details/isar_user_det.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarServices {
  Future<bool> isLoggedIn() async {
    final isar = await openDB();
    UserModel? collection = await isar.userModels.get(1);
    if (collection == null) {
      return false;
    } else {
      return collection.uid!.isEmpty
          ? false
          : collection.alreadyLoginStatus == false
              ? false
              : true;
    }
  }

  // Open the database
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      Directory dir = Platform.isAndroid
          ? await getApplicationDocumentsDirectory()
          : await getApplicationSupportDirectory();

      return await Isar.open(
        directory: dir.path,
        [UserModelSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  // Log out user by clearing user data
  // Future<void> logOutUser() async {
  //   Isar isar = await openDB();

  //   await isar.writeTxn(() async {
  //     await isar.userModels.clear();
  //   });
  // }

  // Get User document number (UID)
  Future<String> getUserDocNo() async {
    final isar = await openDB();
    UserModel? collection = await isar.userModels.get(1);

    if (collection == null) {
      return "";
    } else {
      return collection.uid ?? "";
    }
  }

  // Save user data
  Future<void> saveUserData({
    required String? uid,
    required String? utype,
    required bool? alreadyLoginStatus,
  }) async {
    final isar = await openDB();

    final newUser = UserModel()
      ..uid = uid
      ..utype = utype
      ..alreadyLoginStatus = alreadyLoginStatus;

    await isar.writeTxn(() async {
      await isar.userModels.put(newUser);
    });
  }
}
