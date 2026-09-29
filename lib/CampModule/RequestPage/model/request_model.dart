// To parse this JSON data, do
//
//     final requestModel = requestModelFromJson(jsonString);

import 'dart:convert';

RequestModel requestModelFromJson(String str) =>
    RequestModel.fromJson(json.decode(str));

String requestModelToJson(RequestModel data) => json.encode(data.toJson());

class RequestModel {
  String message;

  RequestModel({
    required this.message,
  });

  RequestModel copyWith({
    String? message,
  }) =>
      RequestModel(
        message: message ?? this.message,
      );

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
