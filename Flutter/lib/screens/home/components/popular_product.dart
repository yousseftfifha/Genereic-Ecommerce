import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/services/ProductService.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductService ps = new ProductService();
    return Column(children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SectionTitle(title: "Recent Products", press: () {}),
      ),
      SizedBox(height: getProportionateScreenWidth(30)),
      FutureBuilder(
          future: ps.fetchData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...List.generate(snapshot.data.length, (index) {
                    return ProductCard(product: snapshot.data[index]);
                  }),
                ]),
              );
            } else {
              return CircularProgressIndicator();
            }
          })
    ]);
  }
}
