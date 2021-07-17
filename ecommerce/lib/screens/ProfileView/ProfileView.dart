import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileView extends StatelessWidget {
  static String routeName = "/ProfileView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Body(),
    );
  }
}
