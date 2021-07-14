import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/models/Customer.dart';

User UserModelJson(String str) =>
    User.fromJson(json.decode(str));

String UserModelToJson(User data) => json.encode(data.toJson());
@JsonSerializable()
class User {
  int id;
  String email;
  String username;
  String password;
  Customer customer= Customer();
  User({this.id, this.email, this.username, this.password,this.customer});
  factory User.fromJson(Map<dynamic, dynamic> json) =>

  User(
      id: json["id"],email: json["email"],username: json["username"],password: json["password"],customer: json["customer"]);

  Map<String, dynamic> toJson() => {
    'id': id,
    "username": username,
    "email":email,
    "password":password,
  };
  String get mail => email;

  String get pwd => password;

  String get usr => username;

  int get ID => id;

  Customer get cs =>customer;


}
