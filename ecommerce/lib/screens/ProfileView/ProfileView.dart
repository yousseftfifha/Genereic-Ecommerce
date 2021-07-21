import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

import 'components/body.dart';

class ProfileView extends StatelessWidget {
  static String routeName = "/ProfileView";
  const ProfileView({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Body(user: user),
    );
  }
}
