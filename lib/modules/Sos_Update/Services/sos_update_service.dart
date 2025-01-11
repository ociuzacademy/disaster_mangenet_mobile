import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/Sos_Update/Models/sosmodel.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:http/http.dart' as http;

Future<Sosupdate> SOSupdate({
  required String email,
  required String secondaryemail,
}) async {
  try {
    Map param = {
      "user": 1,
      "email1": email,
      "email2": secondaryemail,
    };
    final resp = await http.post(
      Uri.parse(Urls.EmailUpdate),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 201) {
      final response = Sosupdate.fromJson(decoded);
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
