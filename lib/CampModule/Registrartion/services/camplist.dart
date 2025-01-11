import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CampModule/Registrartion/models/camplistmodel.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/Sos_Update/Models/sosmodel.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:http/http.dart' as http;

Future<CampslistModel> CampList() async {
  try {
    final resp = await http.get(
      Uri.parse(Urls.VoluntercampCampList),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 201) {
      final response = CampslistModel.fromJson(decoded);
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
