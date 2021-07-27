import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shop_app/models/Address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/User.dart';

class AddressService {
  String url = "http://localhost:8081/api/address";
  Future AddAddress(Address address, int id, BuildContext context) async {
    var response = await http.post(url + '/' + id.toString(),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<dynamic, dynamic>{
          "street": address.street,
          "city": address.city,
          "state": address.state,
          "country": address.country,
          "zipcode": address.zipcode,
        }));

    String responseString = response.body;
  }

  Future fetchData(int id) async {
    var data1 = await http.get(url + '/' + id.toString());
    var jsonDatas = json.decode(data1.body);
    List<Address> addresses = [];

    for (var jsonData in jsonDatas) {
      Address address = Address.fromJson(jsonData);
      addresses.add(address);
    }
    return addresses;
  }
}
