// To parse this JSON data, do
//
//     final refugeesregModel = refugeesregModelFromJson(jsonString);

import 'dart:convert';

RefugeesregModel refugeesregModelFromJson(String str) =>
    RefugeesregModel.fromJson(json.decode(str));

String refugeesregModelToJson(RefugeesregModel data) =>
    json.encode(data.toJson());

class RefugeesregModel {
  String message;

  RefugeesregModel({
    required this.message,
  });

  RefugeesregModel copyWith({
    String? message,
  }) =>
      RefugeesregModel(
        message: message ?? this.message,
      );

  factory RefugeesregModel.fromJson(Map<String, dynamic> json) =>
      RefugeesregModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
