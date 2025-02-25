import 'dart:io';
import 'dart:convert';
import 'package:disaster_management/CampModule/RefugeeaddPage/model/refugeesregModel.dart';
import 'package:disaster_management/app_functions/app_functions.dart';
import 'package:disaster_management/app_functions/local_storage_function.dart';
import 'package:disaster_management/constants/urls.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

Future<RefugeesregModel> refugeeserv({
  required String name,
  required File image,
  required String age,
  required String gender,
  required String camp,
  required String medicines_used,
  required String address,
  required String family_members,
  required String contact,
  required String no_of_people_missing,
  required String missing_person_info,
  required String additional_info,
  required String volunteer,
  required String date_of_entry,
}) async {
  try {
    String? cmpid = await SharedPrefHelper.getCampid();
    print('Retrieved ID: $cmpid');
    int? id = await SharedPrefHelper.getId();
    String? userid = id.toString();
    print('Retrieved ID: $id');
    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(Urls.refugees));

    // Add fields to the request
    request.fields['name'] = name;
    request.fields['age'] = age;
    request.fields['gender'] = gender;
    request.fields['camp'] = cmpid!;
    request.fields['medicines_used'] = medicines_used;
    request.fields['address'] = address;
    request.fields['family_members'] = family_members;
    request.fields['contact'] = contact;
    request.fields['no_of_people_missing'] = no_of_people_missing;
    request.fields['missing_person_info'] = missing_person_info;
    request.fields['additional_info'] = additional_info;
    request.fields['volunteer'] = userid;
    request.fields['date_of_entry'] = date_of_entry;

    // Add the image file to the request
    var imageStream = http.ByteStream(image.openRead());
    var imageLength = await image.length();
    var multipartFile = http.MultipartFile(
      'image',
      imageStream,
      imageLength,
      filename: basename(image.path),
    );

    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Log the response
    print('Status Code: ${response.statusCode}');
    var responseData = await response.stream.bytesToString();
    print('Response Body: $responseData');

    // Handle the response
    if (response.statusCode == 200) {
      var decoded = jsonDecode(responseData) as Map<String, dynamic>;
      return RefugeesregModel.fromJson(decoded);
    } else {
      throw Exception('Failed to upload data');
    }
  } on SocketException {
    throw Exception('Server error');
  } on HttpException {
    throw Exception('Something went wrong');
  } on FormatException {
    throw Exception('Bad request');
  } catch (e) {
    throw Exception('Error: ${e.toString()}');
  }
}
