import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:disaster_management/modules/login/model/login_model.dart';
import 'package:http/http.dart' as http;

Future<DonationModel> Donation({required String amount}) async {
  try {
    Map param = {
      "user": "1",
      "amount": amount,
    };
    final resp = await http.post(
      Uri.parse(Urls.Donate),
      body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = DonationModel.fromJson(decoded);
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
