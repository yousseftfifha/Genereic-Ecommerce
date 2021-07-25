import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/login_failure/login_failure_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';

class UserService {
  String url = "http://localhost:8081/api/auth";

  Future login(String username, String password, BuildContext context) async {
    var res = await http.post(url + "/signin",
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}));
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

  Future registerUser(
      String username,
      String email,
      String password,
      String firstname,
      String lastname,
      String Gender,
      int Cellphone,
      DateTime DateOfBirth,
      BuildContext context) async {
    var response = await http.post(url + "/signup",
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
  }

  Future<User> fetchData() async {
    String email = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('username');

    var data = await http
        .get('http://localhost:8081/api/Users/username/' + email.toString());
    var jsonData = json.decode(data.body);
    User user = User.fromJson(jsonData);

    return user;
  }

  Future<String> uploadImage(filename, id) async {
    var Url = 'http://localhost:8081/uploadFile/customer/' + id.toString();
    var request = http.MultipartRequest('PUT', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future DeleteAccount(String username, BuildContext context) async {
    var Url = 'http://localhost:8081/api/Users' + '/' + username;
    var response = await http.delete(
      Url,
      headers: <String, String>{"Content-Type": "application/json"},
    );
  }

  Future updateUser(User user, BuildContext context) async {
    var Url = 'http://localhost:8081/api/Users' + '/' + user.username;
    var response = await http.put(Url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          "username": user.username,
          "email": user.email,
          "customer": {
            "firstName": user.customer.firstName,
            "lastName": user.customer.lastName,
            "phoneNumber": user.customer.phoneNumber,
          }
        }));
    String responseString = response.body;
  }
}
