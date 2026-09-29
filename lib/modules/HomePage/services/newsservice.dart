import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/HomePage/models/newsmodel.dart';
import 'package:http/http.dart' as http;

Future<NewsModel> NewsList() async {
  try {
    final resp = await http.get(
      Uri.parse(Urls.NewsList),
      // body: jsonEncode(param),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );
    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    if (resp.statusCode == 200) {
      final response = NewsModel.fromJson(decoded);
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
