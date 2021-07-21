// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'Category.dart';
import 'Details.dart';
import 'Informations.dart';
import 'Mouvment.dart';
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
    this.information,
    this.mouvement,
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
  Information information;
  Mouvement mouvement;
  List<ProductImage> productImages;
  List<Detail> details;

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        id: json["id"],
        tmpCode: json["tmpCode"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        brand: json["brand"],
        sku: json["sku"],
        isbn: json["isbn"],
        category: Category.fromJson(json["category"]),
        information: Information.fromJson(json["information"]),
        mouvement: Mouvement.fromJson(json["mouvement"]),
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
        "information": information.toJson(),
        "mouvement": mouvement.toJson(),
        "productImages":
            List<dynamic>.from(productImages.map((x) => x.toJson())),
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}
