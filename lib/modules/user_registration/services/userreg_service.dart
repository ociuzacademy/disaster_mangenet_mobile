import 'dart:convert';
import 'dart:io';

import 'package:disaster_management/constants/urls.dart';
import 'package:disaster_management/modules/user_registration/model/userRegmodel.dart';
import 'package:http/http.dart' as http;

Future<UserRegModel> Registration({
  required String name,
  required String phonenumber,
  required String email,
  required String location,
  required String address,
  required String Password,
  required File img,
}) async {
  try {
    // Create a multipart request
    var uri = Uri.parse(Urls.userRegister);
    var request = http.MultipartRequest('POST', uri);

    // Add fields for the form data
    request.fields['name'] = name;
    request.fields['phone_number'] = phonenumber;
    request.fields['email'] = email;
    request.fields['password'] = Password;
    request.fields['address'] = address;
    request.fields['location'] = location;
    request.fields['utype'] = 'user';

    // Add the image as a multipart file
    var imgFile = await http.MultipartFile.fromPath('image', img.path);
    request.files.add(imgFile);

    // Send the request
    var resp = await request.send();

    // Handle the response
    if (resp.statusCode == 200) {
      // Decode the response
      var responseBody = await resp.stream.bytesToString(); // Read stream once
      final Map<String, dynamic> decoded = jsonDecode(responseBody);
      final response = UserRegModel.fromJson(decoded);
      return response;
    } else {
      // Read error response if needed
      var errorResponseBody =
          await resp.stream.bytesToString(); // Read error stream
      throw Exception('Failed to register user: $errorResponseBody');
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
