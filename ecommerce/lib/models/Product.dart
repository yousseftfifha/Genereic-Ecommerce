// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'Category.dart';
import 'Details.dart';

import 'ProductImage.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.tmpCode,
    this.code,
    this.name,
    this.description,
    this.brand,
    this.sku,
    this.isbn,
    this.category,
    this.productImages,
    this.details,
  });

  int id;
  String tmpCode;
  String code;
  String name;
  String description;
  String brand;
  int sku;
  int isbn;
  Category category;
  List<ProductImage> productImages;
  List<Detail> details;
  double price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        tmpCode: json["tmpCode"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        brand: json["brand"],
        sku: json["sku"],
        isbn: json["isbn"],
        category: Category.fromJson(json["category"]),
        productImages: List<ProductImage>.from(
            json["productImages"].map((x) => ProductImage.fromJson(x))),
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tmpCode": tmpCode,
        "code": code,
        "name": name,
        "description": description,
        "brand": brand,
        "sku": sku,
        "isbn": isbn,
        "category": category.toJson(),
        "productImages":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}
