import 'dart:convert';
import 'dart:io';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:http/http.dart' as http;

Future<DonationModel> Donation({required String amount}) async {
  try {
    int? id = await fun().getId();
    print('Retrieved ID: $id');
    Map param = {
      "user": id,
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
