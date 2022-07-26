import 'package:flutter/material.dart';
import 'package:shop_app/screens/ProfileEdit/ProfileEdit.dart';
import 'package:shop_app/screens/ProfileView/ProfileView.dart';
import 'package:shop_app/screens/home/components/DailyStepsPage.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/services/UserService.dart';

import 'profile_menu.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {Navigator.pushNamed(context, ProfileView.routeName)},
          ),
          ProfileMenu(
            text: "Edit Profile",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.pushNamed(context, ProfileEdit.routeName);
            },
          ),
          // ProfileMenu(
          //   text: "Daily Steps",
          //   icon: "assets/icons/Question mark.svg",
          //   press: () {
          //     Navigator.pushNamed(context, DailyStepsPage.routeName);
          //   },
          // ),
          ProfileMenu(
            text: "Delete Account",
            icon: "assets/icons/Log out.svg",
            press: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              UserService us = UserService();
              us.DeleteAccount(preferences.getString("username"), context);
              preferences.clear();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.clear();
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
