import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CampModule/Registrartion/models/volunteerreg_model.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<VolunteerModel> volunteerRegistration({
  required String email,
  required String password,
  required String chooseCamp,
  required String name,
  required String address,
  required String aadhaar,
  required String skillsExp,
  required String phoneNumber,
  required String district,
}) async {
  try {
    // Construct the URL without query parameters
    final url = Uri.parse(Urls.volunteerReg);

    // Prepare the body for the POST request
    final body = {
      'district': district,
      'email': email,
      'password': password,
      'choose_camp': chooseCamp,
      'name': name,
      'address': address,
      'aadhaar': aadhaar,
      'skills_exp': skillsExp,
      'phone_number': phoneNumber,
      'status': 'pending',
      'utype': 'volcmp'
    };

    // Send the POST request with parameters in the body
    final resp = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = VolunteerModel.fromJson(decoded);
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
