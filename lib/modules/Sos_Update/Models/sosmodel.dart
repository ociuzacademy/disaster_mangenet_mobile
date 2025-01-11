// To parse this JSON data, do
//
//     final sosupdate = sosupdateFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Sosupdate sosupdateFromJson(String str) => Sosupdate.fromJson(json.decode(str));

String sosupdateToJson(Sosupdate data) => json.encode(data.toJson());

class Sosupdate {
    final String status;
    final Data data;

    Sosupdate({
        required this.status,
        required this.data,
    });

    Sosupdate copyWith({
        String? status,
        Data? data,
    }) => 
        Sosupdate(
            status: status ?? this.status,
            data: data ?? this.data,
        );

    factory Sosupdate.fromJson(Map<String, dynamic> json) => Sosupdate(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    final int id;
    final int user;
    final String email1;
    final String email2;

    Data({
        required this.id,
        required this.user,
        required this.email1,
        required this.email2,
    });

    Data copyWith({
        int? id,
        int? user,
        String? email1,
        String? email2,
    }) => 
        Data(
            id: id ?? this.id,
            user: user ?? this.user,
            email1: email1 ?? this.email1,
            email2: email2 ?? this.email2,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        user: json["user"],
        email1: json["email1"],
        email2: json["email2"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "email1": email1,
        "email2": email2,
    };
}
