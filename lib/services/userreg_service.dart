import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<String> Registration(
    {required String name,
    required String phonenumber,
    required String email,
    required String location,
    required String address,
    required String Password}) async {
  try {
    Map param = {
      "name": name,
      "phone_number": phonenumber,
      "email": email,
      "password": Password,
      'address': address,
      "location": location,
      "utype": "user"
    };
    final resp = await http.post(
      Uri.parse(Urls.userRegister),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 201) {
      // final response = FuelSModel.fromJson(decoded);
      return "sss";
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
