// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  List<Datum> data;

  UserProfileModel({
    required this.data,
  });

  UserProfileModel copyWith({
    List<Datum>? data,
  }) =>
      UserProfileModel(
        data: data ?? this.data,
      );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String email;
  String address;
  String image;
  String phoneNumber;
  String utype;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.image,
    required this.phoneNumber,
    required this.utype,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? image,
    String? phoneNumber,
    String? utype,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        image: image ?? this.image,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        utype: utype ?? this.utype,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        image: json["image"],
        phoneNumber: json["phone_number"],
        utype: json["utype"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "image": image,
        "phone_number": phoneNumber,
        "utype": utype,
      };
}
