
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Mouvment.dart';
import 'package:shop_app/models/ProductDetails.dart';
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
  ProductInformation productInformation=new ProductInformation();
  List<ProductImage> productImage=new  List<ProductImage>();
  List<ProductDetails> productDetails=new List<ProductDetails>();
  Mouvement mouvement=new Mouvement();
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
    this.productInformation,
    this.productImage,
    this.productDetails,
    this.mouvement
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
    return 'Product{id: $id, code: $code, tmpCode: $tmpCode, sku: $sku, isbn: $isbn, name: $name, brand: $brand, description: $description, category: $category, productInformation: $productInformation, productImage: $productImage, productDetails: $productDetails, mouvement: $mouvement}';
  }
}