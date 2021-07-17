import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService{
  String url = "http://localhost:8081/api";

  Future<http.Response> save(String username, String password) async {
    var res = await http.post(url+"/auth/signin",
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}));
    return res;
  }
}