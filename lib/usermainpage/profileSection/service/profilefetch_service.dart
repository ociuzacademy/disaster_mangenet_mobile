import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/usermainpage/profileSection/models/userprofile_model.dart';
import 'package:http/http.dart' as http;

Future<UserProfileModel> ProfileFetchService({
  required String utype,
}) async {
  try {
    int? id = await SharedPrefHelper.getId();
    String? userid = id.toString();
    print('Retrieved ID: $id');
    // Construct the URL with query parameters
    final url = Uri.parse(Urls.profile).replace(
      queryParameters: {
        'utype': utype,
        'user': userid,
      },
    );

    // Send the GET request
    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = UserProfileModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception(e.toString());
  }
}
