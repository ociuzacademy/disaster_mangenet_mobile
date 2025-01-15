import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CollectionModule/dressentrypage/model/stock_enter_model.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<StockEnterModel> foodStockService({
  required String item_name,
  required String item_type,
  required String quantity,
  required String unit_type,
  required String food_expiry_date,
}) async {
  try {
    // Construct the URL (no query parameters here for POST)
    final url = Uri.parse(Urls.stocks);

    // Create the body as a JSON-encoded string
    final body = jsonEncode({
      'item_name': item_name,
      'item_type': item_type,
      'quantity': quantity,
      'unit_type': unit_type,
      'food_expiry_date': food_expiry_date,
      'collection_id': '19',
      'section_id': '11',
      'item_category': 'Food',
    });

    // Send the POST request with JSON body
    final resp = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: body,
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = StockEnterModel.fromJson(decoded);
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
