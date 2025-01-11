import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:disaster_management/modules/sosmessage/model/sosmessagemodel.dart';
import 'package:http/http.dart' as http;

Future<String> SOSMessage(
    {required String sosmessage,
    required String latitude,
    required String longitude}) async {
  try {
    Map param = {
      "user": 1,
      "message": sosmessage,
      "latitude": longitude,
      "longitude": longitude,
    };
    final resp = await http.post(
      Uri.parse(Urls.SosMessage),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      // final response = Sosmessage.fromJson(decoded);
      return decoded["status"];
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
