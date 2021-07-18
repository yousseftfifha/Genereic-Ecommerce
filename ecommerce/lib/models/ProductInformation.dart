
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
ProductInformation ProductModelJson(String str) =>
    ProductInformation.fromJson(json.decode(str));

String UserModelToJson(ProductInformation data) => json.encode(data.toJson());
@JsonSerializable()
class ProductInformation{
  int id;
  int max;
  int min;
  int threshold;
  int security;

  ProductInformation({
    this.id,
    this.max,
    this.min,
    this.threshold,
    this.security
  });
  factory ProductInformation.fromJson(Map<dynamic, dynamic> json) =>

      ProductInformation(
        id: json["id"],
        max: json["max"],
        min: json["min"],
        threshold: json["threshold"],
        security: json["security"]
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    "max": max,
    "min":min,
    "threshold":threshold,
    "security":security
  };

  @override
  String toString() {
    return 'ProductDetails{id: $id, max: $max, min: $min, threshold: $threshold, security: $security}';
  }
}