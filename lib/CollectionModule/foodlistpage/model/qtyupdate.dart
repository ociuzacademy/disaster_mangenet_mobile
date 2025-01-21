// To parse this JSON data, do
//
//     final qtyupdateModel = qtyupdateModelFromJson(jsonString);

import 'dart:convert';

QtyupdateModel qtyupdateModelFromJson(String str) =>
    QtyupdateModel.fromJson(json.decode(str));

String qtyupdateModelToJson(QtyupdateModel data) => json.encode(data.toJson());

class QtyupdateModel {
  String detail;

  QtyupdateModel({
    required this.detail,
  });

  QtyupdateModel copyWith({
    String? detail,
  }) =>
      QtyupdateModel(
        detail: detail ?? this.detail,
      );

  factory QtyupdateModel.fromJson(Map<String, dynamic> json) => QtyupdateModel(
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
      };
}
