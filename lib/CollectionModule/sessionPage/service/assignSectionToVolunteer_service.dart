import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/CollectionModule/sessionPage/model/assignSectionToVolunteer_model.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<AssignSectionToVolunteerModel> assignSectionToVolunteer_ser({
  required String sectionID,
}) async {
  try {
    // Construct the URL with query parameters
    int? id = await SharedPrefHelper.getId();
    String? userid = id.toString();
    print('Retrieved ID: $id ');

    final url = Uri.parse(Urls.assignSectionToVolunteer).replace(
      queryParameters: {
        'volunteer_id': userid,
        'section_id': sectionID,
      },
    );

    // Send the GET request
    final resp = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    final Map<String, dynamic> decoded = jsonDecode(resp.body);
    print(resp.body);

    if (resp.statusCode == 200) {
      final response = AssignSectionToVolunteerModel.fromJson(decoded);
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
