import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Order.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  String url = "http://localhost:8081/api/order";

  Future fetchData() async {
    String username = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    var data1 = await http
        .get('http://localhost:8081/api/Users/username/' + username.toString());
    var jsonData = json.decode(data1.body);
    User user = User.fromJson(jsonData);
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    List<Order> orders = [];

    for (var jsonData in jsonDatas) {
      Order order = Order.fromJson(jsonData);
      order.user = user;
      orders.add(order);
    }
    return orders;
  }

  Future Checkout(BuildContext context) async {
    String username = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    var data = await http
        .get('http://localhost:8081/api/Users/username/' + username.toString());
    var jsonData = json.decode(data.body);
    User user = User.fromJson(jsonData);
    var response = await http.post(url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(user));

    String responseString = response.body;
    print(responseString);
  }
}
