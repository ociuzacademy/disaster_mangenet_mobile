// To parse this JSON data, do
//
//     final donationModel = donationModelFromJson(jsonString);

import 'dart:convert';

DonationModel donationModelFromJson(String str) => DonationModel.fromJson(json.decode(str));

String donationModelToJson(DonationModel data) => json.encode(data.toJson());

class DonationModel {
    final String status;
    final String message;

    DonationModel({
        required this.status,
        required this.message,
    });

    DonationModel copyWith({
        String? status,
        String? message,
    }) => 
        DonationModel(
            status: status ?? this.status,
            message: message ?? this.message,
        );

    factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
