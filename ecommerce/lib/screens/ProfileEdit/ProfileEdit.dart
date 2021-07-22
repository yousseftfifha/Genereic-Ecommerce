import 'package:flutter/material.dart';
import 'package:shop_app/models/User.dart';

import 'components/body.dart';

class ProfileEdit extends StatelessWidget {
  static String routeName = "/ProfileEdit";
  const ProfileEdit({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Editing'),
      ),
      body: Body(user: user),
    );
  }
}
