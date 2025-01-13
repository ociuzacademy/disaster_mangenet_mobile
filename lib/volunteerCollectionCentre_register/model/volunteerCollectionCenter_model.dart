// To parse this JSON data, do
//
//     final volunteerRegCollectionModel = volunteerRegCollectionModelFromJson(jsonString);

import 'dart:convert';

VolunteerRegCollectionModel volunteerRegCollectionModelFromJson(String str) =>
    VolunteerRegCollectionModel.fromJson(json.decode(str));

String volunteerRegCollectionModelToJson(VolunteerRegCollectionModel data) =>
    json.encode(data.toJson());

class VolunteerRegCollectionModel {
  String message;

  VolunteerRegCollectionModel({
    required this.message,
  });

  VolunteerRegCollectionModel copyWith({
    String? message,
  }) =>
      VolunteerRegCollectionModel(
        message: message ?? this.message,
      );

  factory VolunteerRegCollectionModel.fromJson(Map<String, dynamic> json) =>
      VolunteerRegCollectionModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
