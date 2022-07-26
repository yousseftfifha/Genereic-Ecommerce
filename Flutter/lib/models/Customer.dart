import 'package:shop_app/models/AddressList.dart';

class Customer {
  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.gender,
    this.dateOfBirth,
    this.url,
    this.addressList,
  });

  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String gender;
  DateTime dateOfBirth;
  String url;
  List<AddressList> addressList;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        url: json["url"],
        addressList: json["addressList"] == null
            ? null
            : List<AddressList>.from(
                json["addressList"].map((x) => AddressList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "url": url,
      };
}
