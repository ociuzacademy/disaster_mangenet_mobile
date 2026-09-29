// To parse this JSON data, do
//
//     final collectionCenterSectionsModel = collectionCenterSectionsModelFromJson(jsonString);

import 'dart:convert';

CollectionCenterSectionsModel collectionCenterSectionsModelFromJson(
        String str) =>
    CollectionCenterSectionsModel.fromJson(json.decode(str));

String collectionCenterSectionsModelToJson(
        CollectionCenterSectionsModel data) =>
    json.encode(data.toJson());

class CollectionCenterSectionsModel {
  List<Datum> data;

  CollectionCenterSectionsModel({
    required this.data,
  });

  CollectionCenterSectionsModel copyWith({
    List<Datum>? data,
  }) =>
      CollectionCenterSectionsModel(
        data: data ?? this.data,
      );

  factory CollectionCenterSectionsModel.fromJson(Map<String, dynamic> json) =>
      CollectionCenterSectionsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String sectionName;

  Datum({
    required this.id,
    required this.sectionName,
  });

  Datum copyWith({
    int? id,
    String? sectionName,
  }) =>
      Datum(
        id: id ?? this.id,
        sectionName: sectionName ?? this.sectionName,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sectionName: json["section_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "section_name": sectionName,
      };
}
