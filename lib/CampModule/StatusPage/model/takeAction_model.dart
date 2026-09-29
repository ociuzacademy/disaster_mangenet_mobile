// To parse this JSON data, do
//
//     final takeActionModel = takeActionModelFromJson(jsonString);

import 'dart:convert';

TakeActionModel takeActionModelFromJson(String str) =>
    TakeActionModel.fromJson(json.decode(str));

String takeActionModelToJson(TakeActionModel data) =>
    json.encode(data.toJson());

class TakeActionModel {
  String message;

  TakeActionModel({
    required this.message,
  });

  TakeActionModel copyWith({
    String? message,
  }) =>
      TakeActionModel(
        message: message ?? this.message,
      );

  factory TakeActionModel.fromJson(Map<String, dynamic> json) =>
      TakeActionModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
