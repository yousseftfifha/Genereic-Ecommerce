// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.id,
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipcode,
  });

  int id;
  String street;
  String city;
  String state;
  String country;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
      };
}
