// To parse this JSON data, do
//
//     final loadMechanicItemsResponseModel = loadMechanicItemsResponseModelFromJson(jsonString);

import 'dart:convert';

List<LoadMechanicItemsResponseModel> loadMechanicItemsResponseModelFromJson(
        String str) =>
    List<LoadMechanicItemsResponseModel>.from(json
        .decode(str)
        .map((x) => LoadMechanicItemsResponseModel.fromJson(x)));

String loadMechanicItemsResponseModelToJson(
        List<LoadMechanicItemsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoadMechanicItemsResponseModel {
  LoadMechanicItemsResponseModel({
    this.id,
    this.category,
    this.itemDesc,
    this.price,
    this.v,
  });

  String id;
  String category;
  String itemDesc;
  double price;
  int v;

  factory LoadMechanicItemsResponseModel.fromJson(Map<String, dynamic> json) =>
      LoadMechanicItemsResponseModel(
        id: json["_id"],
        category: json["Category"],
        itemDesc: json["ItemDesc"],
        price: json["Price"].toDouble(),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Category": category,
        "ItemDesc": itemDesc,
        "Price": price,
        "__v": v,
      };
  static List<LoadMechanicItemsResponseModel> parseMechanicItems(
      String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<LoadMechanicItemsResponseModel> mechanicItemsList = list
        .map((model) => LoadMechanicItemsResponseModel.fromJson(model))
        .toList();
    return mechanicItemsList;
  }
}
