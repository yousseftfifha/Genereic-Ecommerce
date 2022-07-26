import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/ProfileEdit/components/ProfileEditScreen.dart';
import 'package:shop_app/services/UserService.dart';

import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key, @required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    UserService us = new UserService();
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: us.fetchData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      SizedBox(height: SizeConfig.screenHeight * 0.03);
                      Text("Profile Edititng", style: headingStyle);
                      SizedBox(height: SizeConfig.screenHeight * 0.06);
                      return ProfileEditScreen(profileModel: snapshot.data);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
