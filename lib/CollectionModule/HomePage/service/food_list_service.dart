import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<StockListsModel> FoodListService({
  required String item_category,
}) async {
  try {
    String? collid = await SharedPrefHelper.getCollectionid();
    print('Retrieved Collection ID: $collid');
    String? sectionid = await SharedPrefHelper.getSectionId();
    print('Retrieved Section ID: $sectionid');
    // Construct the URL with query parameters for GET request
    final url = Uri.parse(Urls.stocks).replace(queryParameters: {
      'collection_id': collid,
      'section_id': sectionid,
      'item_category': item_category,
    });

    // Send the GET request with query parameters
    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = StockListsModel.fromJson(decoded);
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
