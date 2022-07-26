import 'package:flutter/material.dart';
import 'componenets/body.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  static String routeName = "/checkout_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Checkout Successed"),
      ),
      body: Body(),
    );
  }
}
