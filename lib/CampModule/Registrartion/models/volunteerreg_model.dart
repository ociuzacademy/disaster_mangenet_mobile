// To parse this JSON data, do
//
//     final volunteerModel = volunteerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VolunteerModel volunteerModelFromJson(String str) =>
    VolunteerModel.fromJson(json.decode(str));

String volunteerModelToJson(VolunteerModel data) => json.encode(data.toJson());

class VolunteerModel {
  String message;

  VolunteerModel({
    required this.message,
  });

  VolunteerModel copyWith({
    String? message,
  }) =>
      VolunteerModel(
        message: message ?? this.message,
      );

  factory VolunteerModel.fromJson(Map<String, dynamic> json) => VolunteerModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
