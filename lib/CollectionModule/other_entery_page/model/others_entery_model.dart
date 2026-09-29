// To parse this JSON data, do
//
//     final othersEnteryModel = othersEnteryModelFromJson(jsonString);

import 'dart:convert';

OthersEnteryModel othersEnteryModelFromJson(String str) => OthersEnteryModel.fromJson(json.decode(str));

String othersEnteryModelToJson(OthersEnteryModel data) => json.encode(data.toJson());

class OthersEnteryModel {
    String status;
    String message;

    OthersEnteryModel({
        required this.status,
        required this.message,
    });

    OthersEnteryModel copyWith({
        String? status,
        String? message,
    }) => 
        OthersEnteryModel(
            status: status ?? this.status,
            message: message ?? this.message,
        );

    factory OthersEnteryModel.fromJson(Map<String, dynamic> json) => OthersEnteryModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
