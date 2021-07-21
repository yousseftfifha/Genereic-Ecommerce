import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/services/UserService.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstname;
  String lastname;
  int cellphone;
  String gender;
  DateTime dateofbirth;
  TextEditingController firstnameC = TextEditingController();
  TextEditingController lastnameC = TextEditingController();
  TextEditingController cellphoneC = TextEditingController();
  TextEditingController genderC = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildGenderFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          buildDobFormField(),
          SizedBox(height: getProportionateScreenHeight(40)),
          FormError(errors: errors),


          DefaultButton(
            text: "continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                username = preferences.getString('username');
                email = preferences.getString('email');
                password = preferences.getString('password');
                // var now = DateTime.now();
                // print(DateFormat('yyyy-MM-dd').format(selectedDate));
                //
                // print(DateFormat().format(now)); // This will return date using the default locale
                // print(DateFormat('yyyy-MM-dd hh:mm:ss').format(now));
                // print(DateFormat('yyyy-MM-dd').format(now));
                // print(DateFormat.yMMMMd().format(now)); // print long date
                // print(DateFormat.yMd().format(now)); // print short date
                // print(DateFormat.jms().format(now)); // print time
                UserService us = new UserService();
                us.registerUser(username, email,password, firstnameC.text,lastnameC.text,genderC.text,int.parse(cellphoneC.text),DateTime.parse(DateFormat('yyyy-MM-dd').format(selectedDate)),context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
  getFormatedDate(_date) {
    var inputFormat = DateFormat('dd/MM/yyyy');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }

  TextFormField buildGenderFormField() {
    return TextFormField(
      controller: genderC,
      onSaved: (newValue) => gender = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Gender",
        hintText: "Enter your Gender",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: cellphoneC,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => cellphone = newValue as int ,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastnameC,
      onSaved: (newValue) => lastname = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstnameC,
      onSaved: (newValue) => firstname = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
  DateTimeFormField buildDobFormField() {
    return DateTimeFormField(
      onSaved: (val) {
        dateofbirth = selectedDate;
      },
      // controller: _dateController,
      // keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelText: "Date",
        icon: Icon(Icons.calendar_today),
      ),

    );
  }

  String email = "";
  String password = "";
  String username = "";

  Future getInfo()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    username = preferences.getString('username');
    email = preferences.getString('email');
    password = preferences.getString('password');
    print(email);
    print(username);
    print(password);
  }

}

