import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CampModule/RequestPage/model/request_model.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<RequestModel> requestServ({
  required String category,
  required String description,
  required String refugeeid,
  required String camp,
}) async {
  try {
    int? id = await SharedPrefHelper.getId();
    String? userid = id.toString();
    print('Retrieved ID: $id');
    String? cmpid = await SharedPrefHelper.getCampid();
    print('Retrieved ID: $cmpid');
    Map param = {
      "volunteer": userid,
      "category": category,
      "refugee": refugeeid,
      "description": description,
      "camp": cmpid,
    };
    final resp = await http.post(
      Uri.parse(Urls.requirements),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = RequestModel.fromJson(decoded);
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
