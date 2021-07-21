import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Mouvment.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/ProductDetails.dart';
import 'package:shop_app/models/ProductInformation.dart';
import 'package:shop_app/models/ProductImage.dart';


class ProductService {
  String url = "http://localhost:8081/api/product";

  Future fetchData() async {
    var data = await http.get(url);
    var jsonDatas = json.decode(data.body);
    List<Product> products=[];
    Product product = new Product();
    Category category=new Category();
    ProductInformation productInformations=new ProductInformation();
    Mouvement mouvement=new Mouvement();
    for (var jsonData in jsonDatas) {
       Iterable list = jsonData['productImages'];
       List<ProductImage> productImage=list.map((i) => ProductImage.fromJson(i)).toList();
       Iterable list1 = jsonData['details'];
       List<ProductDetails> productDetails=list1.map((i) => ProductDetails.fromJson(i)).toList();
       category=Category.fromJson(jsonData["category"]);
       productInformations=ProductInformation.fromJson(jsonData["information"]);
       mouvement=Mouvement.fromJson(jsonData["mouvement"]);
       product=Product.fromJson(jsonData);


       product.category=category;
       product.productInformation=productInformations;
       product.productImage=productImage;
       product.productDetails=productDetails;
       product.mouvement=mouvement;
       products.add(product);
    }
   return products;
  }
  Future fetchDataByCategory(int id) async {
    var data = await http.get(url+"/category/"+id.toString());
    var jsonDatas = json.decode(data.body);
    List<Product> products=[];
    Product product = new Product();
    Category category=new Category();
    ProductInformation productInformations=new ProductInformation();
    Mouvement mouvement=new Mouvement();
    for (var jsonData in jsonDatas) {
      Iterable list = jsonData['productImages'];
      List<ProductImage> productImage=list.map((i) => ProductImage.fromJson(i)).toList();
      Iterable list1 = jsonData['details'];
      List<ProductDetails> productDetails=list1.map((i) => ProductDetails.fromJson(i)).toList();
      category=Category.fromJson(jsonData["category"]);
      productInformations=ProductInformation.fromJson(jsonData["information"]);
      mouvement=Mouvement.fromJson(jsonData["mouvement"]);
      product=Product.fromJson(jsonData);

      product.category=category;
      product.productInformation=productInformations;
      product.productImage=productImage;
      product.productDetails=productDetails;
      product.mouvement=mouvement;
      products.add(product);
    }
    return products;
  }


}
