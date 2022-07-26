import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop_app/models/OrderCustomer.dart';
import 'package:shop_app/models/OrderCustomerItem.dart';
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
    var data = await http.get(url + "/" + user.customer.id.toString());
    var jsonDatas = json.decode(data.body);
    List<OrderCustomer> orders = [];

    for (var jsonData in jsonDatas) {

      OrderCustomer order = OrderCustomer.fromJson(jsonData);
      for (OrderCustomerItem orderItem in order.orderCustomerItems) {
        var Url = "http://localhost:8081/api/product/price/" +
            orderItem.product.id.toString();

        var data1 = await http.get(Url);
        var jsonData1 = json.decode(data1.body);
        orderItem.product.price = jsonData1;
      }
      order.user = user;
      orders.add(order);
    }
    return orders;
  }

  Future fetchData1(int id) async {
    var data = await http.get(url + "/item/" + id.toString());
    var jsonDatas = json.decode(data.body);
    List<OrderCustomerItem> orderItems = [];
    for (var jsonData in jsonDatas) {
      OrderCustomerItem orderItem = OrderCustomerItem.fromJson(jsonData);
      var Url = "http://localhost:8081/api/product/price/" +
          orderItem.product.id.toString();

      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      orderItem.product.price = jsonData1;
      orderItems.add(orderItem);
    }
    return orderItems;
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
        body: jsonEncode(user.customer));

    String responseString = response.body;
  }
}
