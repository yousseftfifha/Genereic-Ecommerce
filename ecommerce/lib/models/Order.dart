import 'dart:convert';

import 'package:shop_app/models/User.dart';

import 'OrderItem.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({this.id, this.status, this.orderItems, this.user});

  int id;
  String status;
  List<OrderItem> orderItems;
  User user;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        status: json["status"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Order{id: $id, status: $status, orderItems: $orderItems, user: $user}';
  }
}
