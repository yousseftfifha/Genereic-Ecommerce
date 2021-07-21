// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'Product.dart';
import 'User.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.id,
    this.product,
    this.user,
    this.quantity,
  });

  int id;
  Product product;
  User user;
  int quantity;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        user: User.fromJson(json["user"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "user": user.toJson(),
        "quantity": quantity,
      };
}
