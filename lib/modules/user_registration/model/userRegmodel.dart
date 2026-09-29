// To parse this JSON data, do
//
//     final userRegModel = userRegModelFromJson(jsonString);

import 'dart:convert';

UserRegModel userRegModelFromJson(String str) =>
    UserRegModel.fromJson(json.decode(str));

String userRegModelToJson(UserRegModel data) => json.encode(data.toJson());

class UserRegModel {
  String message;

  UserRegModel({
    required this.message,
  });

  UserRegModel copyWith({
    String? message,
  }) =>
      UserRegModel(
        message: message ?? this.message,
      );

  factory UserRegModel.fromJson(Map<String, dynamic> json) => UserRegModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
