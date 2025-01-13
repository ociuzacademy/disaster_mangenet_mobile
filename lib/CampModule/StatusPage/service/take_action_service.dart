import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CampModule/StatusPage/model/takeAction_model.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<TakeActionModel> takeActionServ({
  required String primerykey,
}) async {
  try {
    // Construct the URL dynamically with the primary key
    final url = Uri.parse('${Urls.requirements}$primerykey/');

    // Send the PATCH request
    final resp = await http.patch(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    // Decode the response body
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    // Check the status code and return the response

    if (resp.statusCode == 200) {
      final response = TakeActionModel.fromJson(decoded);
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
