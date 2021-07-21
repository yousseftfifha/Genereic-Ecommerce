
import 'dart:convert';

import 'package:shop_app/models/User.dart';

import 'Customer.dart';
import 'Product.dart';

Cart CartModelJson(String str) => Cart.fromJson(json.decode(str));

String CartModelToJson(Cart data) => json.encode(data.toJson());

class Cart {
  int id;
  Product product;
  int quantity;
  User user;
  Cart(
      {this.id,
        this.product,
        this.quantity,
        this.user
      });

  factory Cart.fromJson(Map<dynamic, dynamic> json) => Cart(
      id: json["id"],
      quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    "product": product,
    "quantity": quantity,
    "user":user
  };

  @override
  String toString() {
    return 'Cart{id: $id, product: $product, quantity: $quantity, user: $user}';
  }
}

// Demo data for our cart

