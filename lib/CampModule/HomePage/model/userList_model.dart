// To parse this JSON data, do
//
//     final userlistModel = userlistModelFromJson(jsonString);

import 'dart:convert';

UserlistModel userlistModelFromJson(String str) =>
    UserlistModel.fromJson(json.decode(str));

String userlistModelToJson(UserlistModel data) => json.encode(data.toJson());

class UserlistModel {
  List<Datum> data;

  UserlistModel({
    required this.data,
  });

  UserlistModel copyWith({
    List<Datum>? data,
  }) =>
      UserlistModel(
        data: data ?? this.data,
      );

  factory UserlistModel.fromJson(Map<String, dynamic> json) => UserlistModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String image;
  int age;
  String gender;
  String medicinesUsed;
  String address;
  String familyMembers;
  String contact;
  String noOfPeopleMissing;
  String missingPersonInfo;
  String additionalInfo;
  DateTime dateOfEntry;
  int camp;
  int volunteer;

  Datum({
    required this.id,
    required this.name,
    required this.image,
    required this.age,
    required this.gender,
    required this.medicinesUsed,
    required this.address,
    required this.familyMembers,
    required this.contact,
    required this.noOfPeopleMissing,
    required this.missingPersonInfo,
    required this.additionalInfo,
    required this.dateOfEntry,
    required this.camp,
    required this.volunteer,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? image,
    int? age,
    String? gender,
    String? medicinesUsed,
    String? address,
    String? familyMembers,
    String? contact,
    String? noOfPeopleMissing,
    String? missingPersonInfo,
    String? additionalInfo,
    DateTime? dateOfEntry,
    int? camp,
    int? volunteer,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        medicinesUsed: medicinesUsed ?? this.medicinesUsed,
        address: address ?? this.address,
        familyMembers: familyMembers ?? this.familyMembers,
        contact: contact ?? this.contact,
        noOfPeopleMissing: noOfPeopleMissing ?? this.noOfPeopleMissing,
        missingPersonInfo: missingPersonInfo ?? this.missingPersonInfo,
        additionalInfo: additionalInfo ?? this.additionalInfo,
        dateOfEntry: dateOfEntry ?? this.dateOfEntry,
        camp: camp ?? this.camp,
        volunteer: volunteer ?? this.volunteer,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        age: json["age"],
        gender: json["gender"],
        medicinesUsed: json["medicines_used"],
        address: json["address"],
        familyMembers: json["family_members"],
        contact: json["contact"],
        noOfPeopleMissing: json["no_of_people_missing"],
        missingPersonInfo: json["missing_person_info"],
        additionalInfo: json["additional_info"],
        dateOfEntry: DateTime.parse(json["date_of_entry"]),
        camp: json["camp"],
        volunteer: json["volunteer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "age": age,
        "gender": gender,
        "medicines_used": medicinesUsed,
        "address": address,
        "family_members": familyMembers,
        "contact": contact,
        "no_of_people_missing": noOfPeopleMissing,
        "missing_person_info": missingPersonInfo,
        "additional_info": additionalInfo,
        "date_of_entry": dateOfEntry.toIso8601String(),
        "camp": camp,
        "volunteer": volunteer,
      };
}
