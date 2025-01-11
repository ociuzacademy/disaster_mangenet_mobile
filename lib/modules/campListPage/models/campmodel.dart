// To parse this JSON data, do
//
//     final campsModel = campsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CampsModel campsModelFromJson(String str) => CampsModel.fromJson(json.decode(str));

String campsModelToJson(CampsModel data) => json.encode(data.toJson());

class CampsModel {
    final List<Datum> data;

    CampsModel({
        required this.data,
    });

    CampsModel copyWith({
        List<Datum>? data,
    }) => 
        CampsModel(
            data: data ?? this.data,
        );

    factory CampsModel.fromJson(Map<String, dynamic> json) => CampsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String name;
    final String district;
    final String address;
    final String gmapLink;
    final double latitude;
    final double longitude;
    final int capacity;
    final String contactPerson;
    final String contactPhone;
    final String contactEmail;
    final String description;
    final String profilePic;
    final double distance;

    Datum({
        required this.id,
        required this.name,
        required this.district,
        required this.address,
        required this.gmapLink,
        required this.latitude,
        required this.longitude,
        required this.capacity,
        required this.contactPerson,
        required this.contactPhone,
        required this.contactEmail,
        required this.description,
        required this.profilePic,
        required this.distance,
    });

    Datum copyWith({
        int? id,
        String? name,
        String? district,
        String? address,
        String? gmapLink,
        double? latitude,
        double? longitude,
        int? capacity,
        String? contactPerson,
        String? contactPhone,
        String? contactEmail,
        String? description,
        String? profilePic,
        double? distance,
    }) => 
        Datum(
            id: id ?? this.id,
            name: name ?? this.name,
            district: district ?? this.district,
            address: address ?? this.address,
            gmapLink: gmapLink ?? this.gmapLink,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            capacity: capacity ?? this.capacity,
            contactPerson: contactPerson ?? this.contactPerson,
            contactPhone: contactPhone ?? this.contactPhone,
            contactEmail: contactEmail ?? this.contactEmail,
            description: description ?? this.description,
            profilePic: profilePic ?? this.profilePic,
            distance: distance ?? this.distance,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        district: json["district"],
        address: json["address"],
        gmapLink: json["gmap_link"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        capacity: json["capacity"],
        contactPerson: json["contact_person"],
        contactPhone: json["contact_phone"],
        contactEmail: json["contact_email"],
        description: json["description"],
        profilePic: json["profile_pic"],
        distance: json["distance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "district": district,
        "address": address,
        "gmap_link": gmapLink,
        "latitude": latitude,
        "longitude": longitude,
        "capacity": capacity,
        "contact_person": contactPerson,
        "contact_phone": contactPhone,
        "contact_email": contactEmail,
        "description": description,
        "profile_pic": profilePic,
        "distance": distance,
    };
}
