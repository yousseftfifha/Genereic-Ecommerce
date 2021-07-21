import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Customer.dart';
import 'package:shop_app/models/Mouvment.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/ProductImage.dart';
import 'package:shop_app/models/User.dart';

class CartService {
  String url = "http://localhost:8081/api/cart";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    Cart cart = new Cart();
    User user = new User();
    Customer customer = new Customer();
    List<Cart> carts = [];

    for (var jsonData in jsonDatas) {
      cart = Cart.fromJson(jsonData);
      user = User.fromJson(jsonData["user"]);
      customer = Customer.fromJson(jsonData["user"]["customer"]);
      user.customer = customer;
      cart.user = user;

      cart.product = Product.fromJson(jsonData["product"]);
      carts.add(cart);
    }
    return carts;
  }
}
