import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shop_app/models/Category.dart';

class CategoryService {
  String url = "http://localhost:8081/api/category";
  Future fetchData() async {
    var data = await http.get(url + "/main");
    var jsonData = json.decode(data.body);
    List<Category> categories = [];
    for (var data in jsonData) {
      Category categorie = new Category();
      categorie = Category.fromJson(data);
      categories.add(categorie);
    }
    return categories;
  }

  Future fetchSubData(int id) async {
    var data = await http.get(url + "/sub/" + id.toString());
    var jsonData = json.decode(data.body);
    List<Category> categories = [];
    for (var data in jsonData) {
      Category categorie = new Category();
      categorie = Category.fromJson(data);
      categories.add(categorie);
    }
    return categories;
  }
}
