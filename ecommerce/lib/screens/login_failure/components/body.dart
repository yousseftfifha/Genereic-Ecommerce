import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/failure.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Failed",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          "Check your credentials",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to Login page",
            press: () {
              getEmail();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }

  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('username');
  }
}
