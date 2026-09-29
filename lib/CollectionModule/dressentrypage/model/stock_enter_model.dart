// To parse this JSON data, do
//
//     final stockEnterModel = stockEnterModelFromJson(jsonString);

import 'dart:convert';

StockEnterModel stockEnterModelFromJson(String str) =>
    StockEnterModel.fromJson(json.decode(str));

String stockEnterModelToJson(StockEnterModel data) =>
    json.encode(data.toJson());

class StockEnterModel {
  String status;
  String message;

  StockEnterModel({
    required this.status,
    required this.message,
  });

  StockEnterModel copyWith({
    String? status,
    String? message,
  }) =>
      StockEnterModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory StockEnterModel.fromJson(Map<String, dynamic> json) =>
      StockEnterModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
