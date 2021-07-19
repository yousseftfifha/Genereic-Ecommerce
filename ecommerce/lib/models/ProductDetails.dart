
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
ProductDetails ProductModelJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String ProductDetailsModelToJson(ProductDetails data) => json.encode(data.toJson());
@JsonSerializable()
class ProductDetails{
  int id;
  String attribute;
  String value;
  ProductDetails({
    this.id,
    this.attribute,
    this.value

  });
  factory ProductDetails.fromJson(Map<dynamic, dynamic> json) =>

      ProductDetails(
        id: json["id"],
        attribute: json["attribute"],
        value: json["value"]

      );

  Map<String, dynamic> toJson() => {
    'id': id,
    "attribute": attribute,
    "value": value
  };

  @override
  String toString() {
    return 'ProductDetails{id: $id, attribute: $attribute, value: $value}';
  }
}