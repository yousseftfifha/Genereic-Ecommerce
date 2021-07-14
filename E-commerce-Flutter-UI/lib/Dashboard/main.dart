
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Dashboard/screens/main/main_screen.dart';

import 'constants.dart';
import 'controllers/MenuController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String routeName = "/MyApp";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: Theme.of(context).textTheme
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
