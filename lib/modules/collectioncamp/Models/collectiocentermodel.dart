// To parse this JSON data, do
//
//     final collectionCenterModel = collectionCenterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CollectionCenterModel collectionCenterModelFromJson(String str) => CollectionCenterModel.fromJson(json.decode(str));

String collectionCenterModelToJson(CollectionCenterModel data) => json.encode(data.toJson());

class CollectionCenterModel {
    final List<Datum> data;

    CollectionCenterModel({
        required this.data,
    });

    CollectionCenterModel copyWith({
        List<Datum>? data,
    }) => 
        CollectionCenterModel(
            data: data ?? this.data,
        );

    factory CollectionCenterModel.fromJson(Map<String, dynamic> json) => CollectionCenterModel(
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
    final String contactPerson;
    final String contactPhone;
    final String contactEmail;
    final String description;
    final dynamic profilePic;
    final String noOfSections;
    final double distance;

    Datum({
        required this.id,
        required this.name,
        required this.district,
        required this.address,
        required this.gmapLink,
        required this.latitude,
        required this.longitude,
        required this.contactPerson,
        required this.contactPhone,
        required this.contactEmail,
        required this.description,
        required this.profilePic,
        required this.noOfSections,
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
        String? contactPerson,
        String? contactPhone,
        String? contactEmail,
        String? description,
        dynamic profilePic,
        String? noOfSections,
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
            contactPerson: contactPerson ?? this.contactPerson,
            contactPhone: contactPhone ?? this.contactPhone,
            contactEmail: contactEmail ?? this.contactEmail,
            description: description ?? this.description,
            profilePic: profilePic ?? this.profilePic,
            noOfSections: noOfSections ?? this.noOfSections,
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
        contactPerson: json["contact_person"],
        contactPhone: json["contact_phone"],
        contactEmail: json["contact_email"],
        description: json["description"],
        profilePic: json["profile_pic"],
        noOfSections: json["no_of_sections"],
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
        "contact_person": contactPerson,
        "contact_phone": contactPhone,
        "contact_email": contactEmail,
        "description": description,
        "profile_pic": profilePic,
        "no_of_sections": noOfSections,
        "distance": distance,
    };
}
