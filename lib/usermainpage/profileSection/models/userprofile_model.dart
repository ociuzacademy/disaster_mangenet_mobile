class UserProfileModel {
  List<Datum> data;

  UserProfileModel({
    required this.data,
  });

  UserProfileModel copyWith({
    List<Datum>? data,
  }) =>
      UserProfileModel(
        data: data ?? this.data,
      );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    // Check if the "data" key is present and not null, otherwise use an empty list
    return UserProfileModel(
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Datum {
  int id;
  String name;
  String email;
  String address;
  String image;
  String phoneNumber;
  String utype;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.image,
    required this.phoneNumber,
    required this.utype,
  });

  Datum copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? image,
    String? phoneNumber,
    String? utype,
  }) =>
      Datum(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        image: image ?? this.image,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        utype: utype ?? this.utype,
      );

  factory Datum.fromJson(Map<String, dynamic> json) {
    // Check if the key exists and is not null; use default empty strings for missing values
    return Datum(
      id: json["id"] ?? 0, // Default value 0 if id is null
      name: json["name"] ?? "", // Default empty string if name is null
      email: json["email"] ?? "", // Default empty string if email is null
      address: json["address"] ?? "", // Default empty string if address is null
      image: json["image"] ?? "", // Default empty string if image is null
      phoneNumber: json["phone_number"] ??
          "", // Default empty string if phone_number is null
      utype: json["utype"] ?? "", // Default empty string if utype is null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "image": image,
      "phone_number": phoneNumber,
      "utype": utype,
    };
  }
}
