import 'dart:convert';

Customer UserModelJson(String str) =>
    Customer.fromJson(json.decode(str));

String CustomerModelToJson(Customer data) => json.encode(data.toJson());
class Customer {
  int id;
  String firstname;
  String lastname;
  String gender;
  int cellphone;
  DateTime  dateofbirth;

  Customer({this.id, this.firstname, this.lastname, this.gender, this.cellphone,
      this.dateofbirth} );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      gender: json["gender"],
      cellphone:json["cellphone"],
      dateofbirth:json["dateofbirth"]);

  Map<String, dynamic> toJson() => {
    'id': id,
    "firstname": firstname,
    "lastname":lastname,
    "gender":gender,
    "cellphone":cellphone,
    "dateofbirth":dateofbirth
  };
  String get fn => firstname;

  String get ln => lastname;

  String get genre => gender;

  DateTime get dob => dateofbirth;

  int get cell => cellphone;

  int get ID => id;

}
