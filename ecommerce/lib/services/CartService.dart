import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';

class CartService {
  String url = "http://localhost:8081/api/cart";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    List<Cart> carts = [];

    for (var jsonData in jsonDatas) {
      Cart cart = Cart.fromJson(jsonData);
      carts.add(cart);
    }
    return carts;
  }

  Future<Cart> AddToCart(
      Product product, int Quantity, BuildContext context) async {
    var response = await http.post(url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(
            <dynamic, dynamic>{"product": product, "quantity": Quantity}));

    String responseString = response.body;
    print(responseString);
  }
}
