import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CollectionModule/other_entery_page/model/others_entery_model.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<OthersEnteryModel> OthersEnteryService({
  required String item_category,
  required String item_name,
  required String quantity,
  required String unit_type,
}) async {
  try {
    String? collid = await SharedPrefHelper.getCollectionid();
    print('Retrieved Collection ID: $collid');
    String? sectionid = await SharedPrefHelper.getSectionId();
    print('Retrieved Section ID: $sectionid');

    // Construct the JSON payload
    final Map<String, dynamic> payload = {
      'collection_id': collid,
      'section_id': sectionid,
      'item_category': item_category,
      'item_name': item_name,
      'quantity': quantity,
    };

    // Send the POST request with JSON body
    final resp = await http.post(
      Uri.parse(Urls.stocks),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(payload),
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = OthersEnteryModel.fromJson(decoded);
      return response;
    } else {
      throw Exception('Failed to load response: ${resp.body}');
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
