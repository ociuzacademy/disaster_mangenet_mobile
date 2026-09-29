// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  List<Datum> data;

  LoginModel({
    required this.data,
  });

  LoginModel copyWith({
    List<Datum>? data,
  }) =>
      LoginModel(
        data: data ?? this.data,
      );

factory LoginModel.fromJson(Map<String, dynamic> json) =>
    LoginModel(
      data: (json["data"] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((x) => Datum.fromJson(x))
          .toList(),
    );
  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String status;
  String message;
  int id;
  String utype;
  String cId;
  String sectionId;
  bool login;

  Datum({
    required this.status,
    required this.message,
    required this.id,
    required this.utype,
    required this.cId,
    required this.sectionId,
    required this.login,
  });

  Datum copyWith({
    String? status,
    String? message,
    int? id,
    String? utype,
    String? cId,
    String? sectionId,
    bool? login,
  }) =>
      Datum(
        status: status ?? this.status,
        message: message ?? this.message,
        id: id ?? this.id,
        utype: utype ?? this.utype,
        cId: cId ?? this.cId,
        sectionId: sectionId ?? this.sectionId,
        login: login ?? this.login,
      );

 factory Datum.fromJson(Map<String, dynamic> json) => Datum(
  status: json["status"]?.toString() ?? "",
  message: json["message"]?.toString() ?? "",
  id: int.tryParse(json["id"]?.toString() ?? "") ?? 0,
  utype: json["utype"]?.toString() ?? "",
  cId: json["c_id"]?.toString() ?? "",
  sectionId: json["section_id"]?.toString() ?? "",
  login: json["login"] == true ||
      json["login"] == 1 ||
      json["login"] == "true",
);
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": id,
        "utype": utype,
        "c_id": cId,
        "section_id": sectionId,
        "login": login,
      };
}
