import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<String> volunteerRegistration({
  required String email,
  required String password,
  required int chooseCamp,
  required String name,
  required String address,
  required String aadhaar,
  required String skillsExp,
  required String phoneNumber,
}) async {
  try {
    Map<String, dynamic> param = {
      "email": email,
      "password": password,
      "choose_camp": chooseCamp,
      "name": name,
      "address": address,
      "aadhaar": aadhaar,
      "skills_exp": skillsExp,
      "phone_number": phoneNumber,
      "status": "pending",
      "utype": "volcmp"
    };

    final response = await http.post(
      Uri.parse(Urls.VoluntercampRegister), // Replace with the correct URL
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 201) {
      return "Registration successful";
    } else {
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      throw Exception(
        'Failed to register: ${errorResponse['message'] ?? 'Unknown error'}',
      );
    }
  } on SocketException {
    throw Exception('No Internet connection');
  } on HttpException {
    throw Exception('Server error');
  } on FormatException {
    throw Exception('Bad response format');
  } catch (e) {
    throw Exception('Unexpected error: ${e.toString()}');
  }
}
