// To parse this JSON data, do
//
//     final medicineEnteryModel = medicineEnteryModelFromJson(jsonString);

import 'dart:convert';

MedicineEnteryModel medicineEnteryModelFromJson(String str) => MedicineEnteryModel.fromJson(json.decode(str));

String medicineEnteryModelToJson(MedicineEnteryModel data) => json.encode(data.toJson());

class MedicineEnteryModel {
    String status;
    String message;

    MedicineEnteryModel({
        required this.status,
        required this.message,
    });

    MedicineEnteryModel copyWith({
        String? status,
        String? message,
    }) => 
        MedicineEnteryModel(
            status: status ?? this.status,
            message: message ?? this.message,
        );

    factory MedicineEnteryModel.fromJson(Map<String, dynamic> json) => MedicineEnteryModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
