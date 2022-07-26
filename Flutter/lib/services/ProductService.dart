import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/Product/components/product_card.dart';

class ProductService {
  String url = "http://localhost:8081/api/product";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    List<Product> products = [];

    for (var jsonData in jsonDatas) {
      Product product = Product.fromJson(jsonData);
      var Url =
          "http://localhost:8081/api/product/price/" + product.id.toString();
      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      product.price = jsonData1;
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
      var Url =
          "http://localhost:8081/api/product/price/" + product.id.toString();
      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      product.price = jsonData1;
      products.add(product);
    }
    return products;
  }

  Future Search(String keywords) async {
    var data = await http.get(url + '/search?search=' + keywords);
    var jsonDatas = json.decode(data.body);
    List<Product> products = [];

    for (var jsonData in jsonDatas) {
      Product product = Product.fromJson(jsonData);
      var Url =
          "http://localhost:8081/api/product/price/" + product.id.toString();
      var data1 = await http.get(Url);
      var jsonData1 = json.decode(data1.body);
      product.price = jsonData1;
      products.add(product);
      print(product);
    }
    return products;
  }
}
