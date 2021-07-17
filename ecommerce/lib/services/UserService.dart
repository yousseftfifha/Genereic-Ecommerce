import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/Customer.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/login_failure/login_failure_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

class UserService {
  String url = "http://localhost:8081/api/auth";

  Future save(String username, String password, BuildContext context) async {
    var res = await http.post(url+"/signin",
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}));
    print(res.body);
    var jsonData = json.decode(res.body);
    List<dynamic> role = jsonData["roles"];
    final int statusCode = res.statusCode;
    if (statusCode == 401) {
      Navigator.pushNamed(context, LoginFailureScreen.routeName);
    } else if (statusCode == 200 && role[0].toString() == "ROLE_USER") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('username', username);
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    } else if (statusCode == 200 && role[0].toString() == "ROLE_ADMIN") {
      print("not your space");
    }
  }

  Future<User> registerUser(
      String username,
      String email,
      String password,
      String firstname,
      String lastname,
      String Gender,
      int Cellphone,
      DateTime DateOfBirth,
      BuildContext context) async {
    var response = await http.post(url+"/signup",
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          "username": username,
          "email": email,
          "password": password,
          "customer": {
            "firstName": firstname,
            "lastName": lastname,
            "gender": Gender,
            "phoneNumber": Cellphone,
            "dateOfBirth": DateOfBirth.toIso8601String()
          }
        }));

    String responseString = response.body;
    print(responseString);
  }
  Future<User> fetchData(User profileModel,Customer customer) async {
    String email = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('username');
    print(email);

    var data = await http.get('http://localhost:8081/api/Users/username/'+email.toString());
    var jsonData = json.decode(data.body);
    profileModel.id = jsonData["id"];
    profileModel.username = jsonData["username"];
    profileModel.email = jsonData["email"];
    customer.id = jsonData["customer"]["id"];
    customer.firstname = jsonData["customer"]["firstName"];
    customer.lastname = jsonData["customer"]["lastName"];
    customer.cellphone = int.parse(jsonData["customer"]["phoneNumber"]);
    customer.gender = jsonData["customer"]["gender"];
    customer.url = jsonData["customer"]["url"];
    customer.dateOfBirth = DateTime.parse(DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(jsonData["customer"]["dateOfBirth"])));

    profileModel.customer = customer;

    return profileModel;
  }
}