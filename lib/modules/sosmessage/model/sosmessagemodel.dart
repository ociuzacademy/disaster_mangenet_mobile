// To parse this JSON data, do
//
//     final sosmessage = sosmessageFromJson(jsonString);

import 'dart:convert';

Sosmessage sosmessageFromJson(String str) => Sosmessage.fromJson(json.decode(str));

String sosmessageToJson(Sosmessage data) => json.encode(data.toJson());

class Sosmessage {
    final String status;

    Sosmessage({
        required this.status,
    });

    Sosmessage copyWith({
        String? status,
    }) => 
        Sosmessage(
            status: status ?? this.status,
        );

    factory Sosmessage.fromJson(Map<String, dynamic> json) => Sosmessage(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
