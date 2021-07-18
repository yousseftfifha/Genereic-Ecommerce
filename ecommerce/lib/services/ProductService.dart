import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';
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
    ProductInformation productDetails=new ProductInformation();
     for (var jsonData in jsonDatas) {
       Iterable list = jsonData['productImages'];
       List<ProductImage> productImage=list.map((i) => ProductImage.fromJson(i)).toList();
       category=Category.fromJson(jsonData["category"]);
       productDetails=ProductInformation.fromJson(jsonData["information"]);
       product=Product.fromJson(jsonData);

       product.category=category;
       product.productDetails=productDetails;
       product.productImage=productImage;
      products.add(product);
    }
   return products;
  }



}
