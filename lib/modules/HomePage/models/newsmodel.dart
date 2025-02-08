// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    final List<Datum> data;

    NewsModel({
        required this.data,
    });

    NewsModel copyWith({
        List<Datum>? data,
    }) => 
        NewsModel(
            data: data ?? this.data,
        );

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String title;
    final String description;
    final String newsPic;
    final String createdAt;
    final String updatedAt;

    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.newsPic,
        required this.createdAt,
        required this.updatedAt,
    });

    Datum copyWith({
        int? id,
        String? title,
        String? description,
        String? newsPic,
        String? createdAt,
        String? updatedAt,
    }) => 
        Datum(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            newsPic: newsPic ?? this.newsPic,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        newsPic: json["news_pic"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "news_pic": newsPic,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
