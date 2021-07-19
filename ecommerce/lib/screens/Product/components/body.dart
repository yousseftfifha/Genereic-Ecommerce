import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/services/ProductService.dart';

import '../../../size_config.dart';
import 'package:http/http.dart' as http;


class Body extends StatelessWidget {
  final Category category;

  const Body({Key key, @required this.category}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ProductService ps=new ProductService();

    return Scaffold(

      // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        body: Container(
            child:FutureBuilder(
                future: ps.fetchDataByCategory(category.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(child: Center(child: Icon(Icons.error)));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                        child: ProductCard(product: snapshot.data[index]),
                    ),
                  );
                }
            )));

  }


}
