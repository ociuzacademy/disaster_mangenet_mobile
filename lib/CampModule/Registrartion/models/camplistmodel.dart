import 'dart:convert';

class CampslistModel {
    final List<Datum>? data;

    CampslistModel({
        this.data,
    });

    CampslistModel copyWith({
        List<Datum>? data,
    }) => 
        CampslistModel(
            data: data ?? this.data,
        );

    factory CampslistModel.fromRawJson(String str) => CampslistModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CampslistModel.fromJson(Map<String, dynamic> json) => CampslistModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? id;
    final String? name;

    Datum({
        this.id,
        this.name,
    });

    Datum copyWith({
        int? id,
        String? name,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
