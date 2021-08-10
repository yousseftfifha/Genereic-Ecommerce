import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/User.dart';

class CartService {
  String url = "http://localhost:8081/api/cart";

  Future fetchData() async {
    String username = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    var data1 = await http
        .get('http://localhost:8081/api/Users/username/' + username.toString());
    var jsonData = json.decode(data1.body);
    User user = User.fromJson(jsonData);
    var data = await http.get(url + '/' + user.customer.id.toString());
    var jsonDatas = json.decode(data.body);
    List<Cart> carts = [];

    for (var jsonData in jsonDatas) {
      Cart cart = Cart.fromJson(jsonData);
      var Url = "http://localhost:8081/api/product/price/" +
          cart.product.id.toString();
      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      cart.product.price = jsonData1;
      carts.add(cart);
    }
    return carts;
  }

  Future AddToCart(Product product, int Quantity, BuildContext context) async {
    String username = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    var data = await http
        .get('http://localhost:8081/api/Users/username/' + username.toString());
    var jsonData = json.decode(data.body);
    User user = User.fromJson(jsonData);
    var response = await http.post(url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          "product": product,
          "quantity": Quantity,
          "customer": user.customer
        }));

    String responseString = response.body;
  }

  Future RemoveFromCart(Cart cart, BuildContext context) async {
    var Url = url + '/' + (cart.id).toString();
    var response = await http.delete(
      Url,
      headers: <String, String>{"Content-Type": "application/json"},
    );
  }

  Future getCartInfo(BuildContext context) async {
    var Url = url + '/info';
    var data = await http.get(Url);
    var jsonData = json.decode(data.body);
    double itemCount = jsonData["itemCount"];
    Map<String, double> map = new Map();
    map["itemCount"] = itemCount;
    return map;
  }

  Future getTotal(BuildContext context) async {
    String username = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    var data1 = await http
        .get('http://localhost:8081/api/Users/username/' + username.toString());
    var jsonData = json.decode(data1.body);
    User user = User.fromJson(jsonData);
    var data = await http.get(url + '/' + user.customer.id.toString());
    var jsonDatas = json.decode(data.body);
    double total = 0;

    for (var jsonData in jsonDatas) {
      Cart cart = Cart.fromJson(jsonData);
      var Url = "http://localhost:8081/api/product/price/" +
          cart.product.id.toString();
      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      cart.product.price = jsonData1;
      total += (cart.quantity * cart.product.price);
    }
    double totalCost = total;
    Map<String, double> map = new Map();
    map["totalCost"] = totalCost;
    return map;
  }
}
