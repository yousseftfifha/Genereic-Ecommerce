import 'package:flutter/material.dart';
import 'package:shop_app/models/Category.dart';

import 'components/body.dart';

class CategoyScreen extends StatelessWidget {
  static String routeName = "/category_screen";
  const CategoyScreen({
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
            " Sub Categories",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
