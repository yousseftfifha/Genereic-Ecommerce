
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/ProductInformation.dart';
import 'package:shop_app/models/ProductImage.dart';
import 'package:shop_app/screens/details/components/product_images.dart';
Product ProductModelJson(String str) =>
    Product.fromJson(json.decode(str));

String UserModelToJson(Product data) => json.encode(data.toJson());
@JsonSerializable()
class Product{
  int id;
  String code;
  String tmpCode;
  int sku;
  int isbn;
  String name;
  String brand;
  String description;
  Category category=new Category();
  ProductInformation productDetails=new ProductInformation();
  List<ProductImage> productImage=new  List<ProductImage>();
  Product({
    this.id,
    this.code,
    this.tmpCode,
    this.sku,
    this.isbn,
    this.name,
    this.brand,
    this.description,
    this.category,
    this.productDetails,
    this.productImage
  });
  factory Product.fromJson(Map<dynamic, dynamic> json) =>

      Product(
          id: json["id"],
          code: json["code"],
        tmpCode: json["tmpCode"],
          sku: json["sku"],
          isbn: json["isbn"],
          name: json["name"],
          brand: json["brand"],
          description: json["description"]
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    "code": code,
    "tmpCode":tmpCode,
    "sku":sku,
    "isbn":isbn,
    "name":name,
    "brand":brand,
    "description":description
  };

  @override
  String toString() {
    return 'Product{id: $id, code: $code, tmpCode: $tmpCode, sku: $sku, isbn: $isbn, name: $name, brand: $brand, description: $description, category: $category, productDetails: $productDetails, productImage: $productImage}';
  }
}
// import 'package:flutter/material.dart';
//
// class Product {
//   final int id;
//   final String title, description;
//   final List<String> images;
//   final List<Color> colors;
//   final double rating, price;
//   final bool isFavourite, isPopular;
//
//   Product({
//     @required this.id,
//     @required this.images,
//     @required this.colors,
//     this.rating = 0.0,
//     this.isFavourite = false,
//     this.isPopular = false,
//     @required this.title,
//     @required this.price,
//     @required this.description,
//   });
// }
//
// // Our demo Products
//
// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];
//
// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
