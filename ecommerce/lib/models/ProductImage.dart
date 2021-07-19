
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
ProductImage ProductModelJson(String str) =>
    ProductImage.fromJson(json.decode(str));

String ProductImageModelToJson(ProductImage data) => json.encode(data.toJson());
@JsonSerializable()
class ProductImage{
  int id;
  String url;
  ProductImage({
    this.id,
    this.url

  });
  factory ProductImage.fromJson(Map<dynamic, dynamic> json) =>

      ProductImage(
          id: json["id"],
          url: json["url"],

      );

  Map<String, dynamic> toJson() => {
    'id': id,
    "url": url
  };

  @override
  String toString() {
    return 'ProductImage{id: $id, url: $url}';
  }
}