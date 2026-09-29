// To parse this JSON data, do
//
//     final assignSectionToVolunteerModel = assignSectionToVolunteerModelFromJson(jsonString);

import 'dart:convert';

AssignSectionToVolunteerModel assignSectionToVolunteerModelFromJson(
        String str) =>
    AssignSectionToVolunteerModel.fromJson(json.decode(str));

String assignSectionToVolunteerModelToJson(
        AssignSectionToVolunteerModel data) =>
    json.encode(data.toJson());

class AssignSectionToVolunteerModel {
  String detail;
  int sectionId;

  AssignSectionToVolunteerModel({
    required this.detail,
    required this.sectionId,
  });

  AssignSectionToVolunteerModel copyWith({
    String? detail,
    int? sectionId,
  }) =>
      AssignSectionToVolunteerModel(
        detail: detail ?? this.detail,
        sectionId: sectionId ?? this.sectionId,
      );

  factory AssignSectionToVolunteerModel.fromJson(Map<String, dynamic> json) =>
      AssignSectionToVolunteerModel(
        detail: json["detail"],
        sectionId: json["section_id"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "section_id": sectionId,
      };
}
