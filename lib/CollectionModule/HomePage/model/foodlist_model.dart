import 'dart:convert';

StockListsModel stockListsModelFromJson(String str) =>
    StockListsModel.fromJson(json.decode(str));

String stockListsModelToJson(StockListsModel data) =>
    json.encode(data.toJson());

class StockListsModel {
  String status;
  List<Datum> data;

  StockListsModel({
    required this.status,
    required this.data,
  });

  StockListsModel copyWith({
    String? status,
    List<Datum>? data,
  }) =>
      StockListsModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory StockListsModel.fromJson(Map<String, dynamic> json) =>
      StockListsModel(
        status: json["status"] ?? "", // Default empty string if null
        data: List<Datum>.from(json["data"]?.map((x) => Datum.fromJson(x)) ??
            []), // Default empty list if null
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String itemCategory;
  String itemName;
  String? description; // Nullable
  int quantity;
  String unitType;
  DateTime dateReceived;
  String? clothingSize; // Nullable
  String? clothingGender; // Nullable
  String? fabricType; // Nullable
  String? color; // Nullable
  String itemType;
  DateTime foodExpiryDate;
  DateTime? medicineExpiryDate; // Nullable
  int collectionCenter;
  int section;

  Datum({
    required this.id,
    required this.itemCategory,
    required this.itemName,
    this.description, // Nullable
    required this.quantity,
    required this.unitType,
    required this.dateReceived,
    this.clothingSize, // Nullable
    this.clothingGender, // Nullable
    this.fabricType, // Nullable
    this.color, // Nullable
    required this.itemType,
    required this.foodExpiryDate,
    this.medicineExpiryDate, // Nullable
    required this.collectionCenter,
    required this.section,
  });

  Datum copyWith({
    int? id,
    String? itemCategory,
    String? itemName,
    String? description, // Nullable
    int? quantity,
    String? unitType,
    DateTime? dateReceived,
    String? clothingSize, // Nullable
    String? clothingGender, // Nullable
    String? fabricType, // Nullable
    String? color, // Nullable
    String? itemType,
    DateTime? foodExpiryDate,
    DateTime? medicineExpiryDate, // Nullable
    int? collectionCenter,
    int? section,
  }) =>
      Datum(
        id: id ?? this.id,
        itemCategory: itemCategory ?? this.itemCategory,
        itemName: itemName ?? this.itemName,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
        unitType: unitType ?? this.unitType,
        dateReceived: dateReceived ?? this.dateReceived,
        clothingSize: clothingSize ?? this.clothingSize,
        clothingGender: clothingGender ?? this.clothingGender,
        fabricType: fabricType ?? this.fabricType,
        color: color ?? this.color,
        itemType: itemType ?? this.itemType,
        foodExpiryDate: foodExpiryDate ?? this.foodExpiryDate,
        medicineExpiryDate: medicineExpiryDate ?? this.medicineExpiryDate,
        collectionCenter: collectionCenter ?? this.collectionCenter,
        section: section ?? this.section,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        itemCategory: json["item_category"] ?? "",
        itemName: json["item_name"] ?? "",
        description: json["description"], // Nullable
        quantity: json["quantity"] ?? 0, // Default 0 if null
        unitType: json["unit_type"] ?? "",
        dateReceived: json["date_received"] != null
            ? DateTime.parse(json["date_received"])
            : DateTime.now(), // Fallback to current date if null
        clothingSize: json["clothing_size"], // Nullable
        clothingGender: json["clothing_gender"], // Nullable
        fabricType: json["fabric_type"], // Nullable
        color: json["color"], // Nullable
        itemType: json["item_type"] ?? "",
        foodExpiryDate: json["food_expiry_date"] != null
            ? DateTime.parse(json["food_expiry_date"])
            : DateTime.now(), // Fallback to current date if null
        medicineExpiryDate: json["medicine_expiry_date"] != null
            ? DateTime.parse(json["medicine_expiry_date"])
            : null, // Nullable
        collectionCenter: json["collection_center"] ?? 0, // Default 0 if null
        section: json["section"] ?? 0, // Default 0 if null
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_category": itemCategory,
        "item_name": itemName,
        "description": description,
        "quantity": quantity,
        "unit_type": unitType,
        "date_received": dateReceived.toIso8601String(),
        "clothing_size": clothingSize,
        "clothing_gender": clothingGender,
        "fabric_type": fabricType,
        "color": color,
        "item_type": itemType,
        "food_expiry_date":
            "${foodExpiryDate.year.toString().padLeft(4, '0')}-${foodExpiryDate.month.toString().padLeft(2, '0')}-${foodExpiryDate.day.toString().padLeft(2, '0')}",
        "medicine_expiry_date":
            medicineExpiryDate?.toIso8601String(), // Nullable
        "collection_center": collectionCenter,
        "section": section,
      };
}
