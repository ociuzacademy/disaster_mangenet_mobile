// To parse this JSON data, do
//
//     final requestListModel = requestListModelFromJson(jsonString);

import 'dart:convert';

RequestListModel requestListModelFromJson(String str) =>
    RequestListModel.fromJson(json.decode(str));

String requestListModelToJson(RequestListModel data) =>
    json.encode(data.toJson());

class RequestListModel {
  List<Datum> data;

  RequestListModel({
    required this.data,
  });

  RequestListModel copyWith({
    List<Datum>? data,
  }) =>
      RequestListModel(
        data: data ?? this.data,
      );

  factory RequestListModel.fromJson(Map<String, dynamic> json) =>
      RequestListModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String refugeeName;
  String category;
  String description;
  DateTime dateRequested;
  String status;
  int refugee;
  int volunteer;
  int camp;

  Datum({
    required this.id,
    required this.refugeeName,
    required this.category,
    required this.description,
    required this.dateRequested,
    required this.status,
    required this.refugee,
    required this.volunteer,
    required this.camp,
  });

  Datum copyWith({
    int? id,
    String? refugeeName,
    String? category,
    String? description,
    DateTime? dateRequested,
    String? status,
    int? refugee,
    int? volunteer,
    int? camp,
  }) =>
      Datum(
        id: id ?? this.id,
        refugeeName: refugeeName ?? this.refugeeName,
        category: category ?? this.category,
        description: description ?? this.description,
        dateRequested: dateRequested ?? this.dateRequested,
        status: status ?? this.status,
        refugee: refugee ?? this.refugee,
        volunteer: volunteer ?? this.volunteer,
        camp: camp ?? this.camp,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        refugeeName: json["refugee_name"],
        category: json["category"],
        description: json["description"],
        dateRequested: DateTime.parse(json["date_requested"]),
        status: json["status"],
        refugee: json["refugee"],
        volunteer: json["volunteer"],
        camp: json["camp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "refugee_name": refugeeName,
        "category": category,
        "description": description,
        "date_requested": dateRequested.toIso8601String(),
        "status": status,
        "refugee": refugee,
        "volunteer": volunteer,
        "camp": camp,
      };
}
