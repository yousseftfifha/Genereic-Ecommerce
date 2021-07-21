import 'dart:convert';

Customer UserModelJson(String str) => Customer.fromJson(json.decode(str));

String CustomerModelToJson(Customer data) => json.encode(data.toJson());

class Customer {
  int id;
  String firstname;
  String lastname;
  String gender;
  int cellphone;
  DateTime dateOfBirth;
  String url;

  Customer(
      {this.id,
      this.firstname,
      this.lastname,
      this.gender,
      this.cellphone,
      this.dateOfBirth,
      this.url});

  factory Customer.fromJson(Map<dynamic, dynamic> json) => Customer(
      id: json["id"],
      firstname: json["firstName"],
      lastname: json["lastName"],
      gender: json["gender"],
      cellphone: int.parse(json["phoneNumber"]),
      dateOfBirth: DateTime.parse(json["dateOfBirth"]),
      url: json["url"]);

  Map<dynamic, dynamic> toJson() => {
        'id': id,
        "firstName": firstname,
        "lastName": lastname,
        "gender": gender,
        "phoneNumber": cellphone,
        "dateOfBirth": dateOfBirth,
        "url": url
      };
}
