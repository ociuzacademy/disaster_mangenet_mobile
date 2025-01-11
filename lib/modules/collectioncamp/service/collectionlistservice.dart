import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/collectioncamp/Models/collectiocentermodel.dart';
import 'package:disaster_management/modules/donation_payment_page/Model/donationmodel.dart';
import 'package:disaster_management/modules/sosmessage/model/sosmessagemodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<CollectionCenterModel> Collectiodetails() async {
  // Check and request location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  } else if (permission == LocationPermission.deniedForever) {
    print('Location permissions are permanently denied');
  } else if (permission == LocationPermission.denied) {
    print('Location permissions are denied');
  }

  // Get current position
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);

  try {
    // Construct the URL with query parameters
    final url = Uri.parse(Urls.GetCollection).replace(queryParameters: {
      "latitude": position.latitude.toString(),
      "longitude": position.longitude.toString(),
    });

    // Send GET request
    final resp = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    // Decode response
    final Map<String, dynamic> decoded = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      final response = CollectionCenterModel.fromJson(decoded);
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
