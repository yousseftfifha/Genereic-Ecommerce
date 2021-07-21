import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Customer.dart';
import 'package:shop_app/models/Mouvment.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/ProductDetails.dart';
import 'package:shop_app/models/ProductImage.dart';
import 'package:shop_app/models/ProductInformation.dart';
import 'package:shop_app/models/User.dart';

class CartService {
  String url = "http://localhost:8081/api/cart";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    Cart cart = new Cart();
    User user = new User();
    Customer customer = new Customer();
    Product product = new Product();
    Category category = new Category();
    ProductInformation productInformations = new ProductInformation();
    Mouvement mouvement = new Mouvement();
    List<Cart> carts = [];

    for (var jsonData in jsonDatas) {
      cart = Cart.fromJson(jsonData);
      user = User.fromJson(jsonData["user"]);
      customer = Customer.fromJson(jsonData["user"]["customer"]);
      user.customer = customer;
      cart.user = user;
      Iterable list = jsonData["product"]['productImages'];
      List<ProductImage> productImage =
          list.map((i) => ProductImage.fromJson(i)).toList();
      Iterable list1 = jsonData["product"]['details'];
      List<ProductDetails> productDetails =
          list1.map((i) => ProductDetails.fromJson(i)).toList();
      category = Category.fromJson(jsonData["product"]["category"]);
      productInformations =
          ProductInformation.fromJson(jsonData["product"]["information"]);
      mouvement = Mouvement.fromJson(jsonData["product"]["mouvement"]);
      product = Product.fromJson(jsonData["product"]);

      product.category = category;
      product.productInformation = productInformations;
      product.productImage = productImage;
      product.productDetails = productDetails;
      product.mouvement = mouvement;
      cart.product = product;
      carts.add(cart);
    }
    return carts;
  }
}
