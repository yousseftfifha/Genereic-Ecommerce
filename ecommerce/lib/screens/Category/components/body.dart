import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/services/CategoryService.dart';

import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import 'category_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
    CategoryService cs=new CategoryService();
    cs.fetchData();

  }

  @override
  Widget build(BuildContext context) {
    CategoryService cs=new CategoryService();

    return Scaffold(

      // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        body: Container(
        child:FutureBuilder(
          future: cs.fetchData(),
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
                  color: Color(0x836FCD86),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                     Spacer(),
                    GestureDetector(
                        onDoubleTap: () {Navigator.pushNamed(context, HomeScreen.routeName);},
                     child :SvgPicture.asset("assets/icons/arrow_right.svg"),
                    )


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
