import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';

import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import 'category_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var categories = List<Category>.generate(200, (index) => null);
  Future<List<Category>> fetchData() async {
    var data = await http.get('http://localhost:8081/api/category');
    var jsonData = json.decode(data.body);
    List<Category> categories = [];
    for (var e in jsonData) {
      Category categorie = new Category();
      categorie.id = e["id"];
      categorie.name = e["name"];
      categorie.description = e["description"];
      categories.add(categorie);
    }
    return categories;

  }
  @override
  void initState() {
    super.initState();
    fetchData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // padding:
      // EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        body: Container(
        child:FutureBuilder(
          future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.data == null) {
      return Container(child: Center(child: Icon(Icons.error)));
      }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(snapshot.data[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  snapshot.data.removeAt(index);
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
             child: CategoryCard(category: snapshot.data[index]),
            ),
          ),
        );
      }
    )));

  }
}
