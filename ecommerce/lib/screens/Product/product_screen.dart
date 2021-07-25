import 'package:flutter/material.dart';
import 'package:shop_app/models/Category.dart';

import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  static String routeName = "/product_screen";
  const ProductScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(category: category),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            " Products",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
