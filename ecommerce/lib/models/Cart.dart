// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'Product.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.id,
    this.product,
    this.quantity,
  });

  int id;
  Product product;
  int quantity;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "quantity": quantity,
      };
}
