import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CampModule/StatusPage/model/requestlist_model.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<RequestListModel> RequestlistServ() async {
  try {
    int? id = await fun().getId();
    String? userid = id.toString();
    print('Retrieved ID: $id');
    final url = Uri.parse(Urls.requirements).replace(
      queryParameters: {
        'volunteer': userid,
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
      final response = RequestListModel.fromJson(decoded);
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
