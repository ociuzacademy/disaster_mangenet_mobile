// import 'dart:convert';
// import 'dart:io';

// import 'package:disaster_management/CollectionModule/HomePage/model/foodlist_model.dart';
// import 'package:disaster_management/CollectionModule/foodlistpage/model/qtyupdate.dart';
// import 'package:disaster_management/constants/urls.dart';
// import 'package:http/http.dart' as http;

// Future<QtyupdateModel> QtyupdateService({
//   required String stockid,
//   required String stockid,
// }) async {
//   try {
//     // Construct the URL with query parameters for GET request
//     final url = Uri.parse(Urls.stocks).replace(queryParameters: {
//       'stock_id': '19',
//       'units': '11',
//     });

//     // Send the GET request with query parameters
//     final resp = await http.get(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//     );

//     final Map<String, dynamic> decoded = jsonDecode(resp.body);
//     print(resp.body);

//     if (resp.statusCode == 200) {
//       final response = QtyupdateModel.fromJson(decoded);
//       return response;
//     } else {
//       throw Exception('Failed to load response');
//     }
//   } on SocketException {
//     throw Exception('Server error');
//   } on HttpException {
//     throw Exception('Something went wrong');
//   } on FormatException {
//     throw Exception('Bad request');
//   } catch (e) {
//     throw Exception(e.toString());
//   }
// }
