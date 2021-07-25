import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/services/CartService.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    CartService cs = new CartService();

    return Scaffold(
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
                future: cs.fetchData(),
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
                            cs.RemoveFromCart(snapshot.data[index], context);
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
                          child: CartCard(cart: snapshot.data[index]),
                        ),
                      ),
                    );
                })));
  }
}
