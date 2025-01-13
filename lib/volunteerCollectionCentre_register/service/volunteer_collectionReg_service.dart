import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/volunteerCollectionCentre_register/model/volunteerCollectionCenter_model.dart';
import 'package:http/http.dart' as http;

Future<VolunteerRegCollectionModel> collectionRegService({
  required String email,
  required String password,
  required String choose_collection_center,
  required String name,
  required String address,
  required String aadhaar,
  required String district,
  required String phone_number,
}) async {
  try {
    // Construct the JSON payload
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password,
      "choose_collection_center": choose_collection_center,
      "name": name,
      "address": address,
      "aadhaar": aadhaar,
      "district": district,
      "phone_number": phone_number,
      "status": "pending",
      "utype": "volcc"
    };

    // Send the POST request with JSON body
    final resp = await http.post(
      Uri.parse(Urls.regvolunteerCc),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = VolunteerRegCollectionModel.fromJson(decoded);
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
