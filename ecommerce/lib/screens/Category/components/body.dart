import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/Product/product_screen.dart';
import 'package:shop_app/services/CategoryService.dart';
import 'category_card.dart';

class Body extends StatefulWidget {
  final Category category;

  const Body({Key key, @required this.category}) : super(key: key);
  @override
  _catScreen createState() => _catScreen();
}

class _catScreen extends State<Body> {
  @override
  Widget build(BuildContext context) {
    CategoryService cs = new CategoryService();

    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: cs.fetchSubData(widget.category.id),
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
                          Navigator.pushNamed(context, ProductScreen.routeName,
                              arguments: snapshot.data[index]);

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
                              SvgPicture.asset("assets/icons/arrow_right.svg"),
                            ],
                          ),
                        ),
                        child: CategoryCard(category: snapshot.data[index]),
                      ),
                    ),
                  );
                })));
  }
}
