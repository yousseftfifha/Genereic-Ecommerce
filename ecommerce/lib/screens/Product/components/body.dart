import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Category.dart';
import 'package:shop_app/screens/Product/components/product_card.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/services/ProductService.dart';

class Body extends StatefulWidget {
  final Category category;

  const Body({Key key, @required this.category}) : super(key: key);

  @override
  _prodScreen createState() => _prodScreen();
}

class _prodScreen extends State<Body> {
  @override
  Widget build(BuildContext context) {
    ProductService ps = new ProductService();

    return Scaffold(

        // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(
                Duration(seconds: 1),
                () {
                  setState(() {});
                },
              );
            },
            child: FutureBuilder(
                future: ps.fetchDataByCategory(widget.category.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Dismissible(
                          key: Key(snapshot.data[index].id.toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(
                                  product: snapshot.data[index]),
                            );
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
                                SvgPicture.asset(
                                    "assets/icons/arrow_right.svg"),
                              ],
                            ),
                          ),
                          child: ProductCard(product: snapshot.data[index]),
                        ),
                      ),
                    );
                })));
  }
}
