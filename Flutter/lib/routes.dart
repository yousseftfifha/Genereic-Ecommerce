import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/Category/category_screen.dart';
import 'package:shop_app/screens/CheckoutSuccess/CheckoutSuccessScreen.dart';
import 'package:shop_app/screens/Orders/OrderItemsScreen.dart';
import 'package:shop_app/screens/Orders/OrderScreen.dart';

import 'package:shop_app/screens/Product/product_screen.dart';
import 'package:shop_app/screens/ProfileEdit/ProfileEdit.dart';
import 'package:shop_app/screens/ProfileView/ProfileView.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/components/DailyStepsPage.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_failure/login_failure_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  LoginFailureScreen.routeName: (context) => LoginFailureScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  CategoyScreen.routeName: (context) => CategoyScreen(),
  ProductScreen.routeName: (context) => ProductScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ProfileView.routeName: (context) => ProfileView(),
  ProfileEdit.routeName: (context) => ProfileEdit(),
  OrderScreen.routeName: (context) => OrderScreen(),
  OrderItemScreen.routeName: (context) => OrderItemScreen(),
  CheckoutSuccessScreen.routeName: (context) => CheckoutSuccessScreen(),
  // DailyStepsPage.routeName: (context) => DailyStepsPage(),
};
