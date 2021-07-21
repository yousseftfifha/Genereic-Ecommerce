import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Mouvment.dart';
import 'package:shop_app/models/Product.dart';

import 'package:shop_app/models/ProductImage.dart';

class ProductService {
  String url = "http://localhost:8081/api/product";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    List<Product> products = [];

    for (var jsonData in jsonDatas) {
      Product product = Product.fromJson(jsonData);
      products.add(product);
    }
    return products;
  }

  Future fetchDataByCategory(int id) async {
    var data = await http.get(url + "/category/" + id.toString());
    var jsonDatas = json.decode(data.body);
    List<Product> products = [];

    for (var jsonData in jsonDatas) {
      Product product = Product.fromJson(jsonData);
      products.add(product);
    }
    return products;
  }
}
