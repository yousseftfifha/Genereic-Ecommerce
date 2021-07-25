import 'package:flutter/material.dart';

import 'package:shop_app/screens/Category/category_screen.dart';
import 'package:shop_app/services/CategoryService.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryService cs = new CategoryService();

    return FutureBuilder(
        future: cs.fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    snapshot.data.length,
                    (index) => CategoryCard(
                      icon: '${snapshot.data[index].url}',
                      text: '${snapshot.data[index].name}',
                      press: () {
                        Navigator.pushNamed(context, CategoyScreen.routeName,
                            arguments: snapshot.data[index]);
                      },
                    ),
                  ),
                ),
              ),
            );
            // return Text(snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.network(icon),

              // child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
