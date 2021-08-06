import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/AddressList.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/services/AddressService.dart';
import 'package:shop_app/services/UserService.dart';
import '../../../size_config.dart';

class ProfileEditScreen extends StatefulWidget {
  final User profileModel;

  const ProfileEditScreen({Key key, @required this.profileModel})
      : super(key: key);
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<ProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final List<String> errors = [];

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

    String countryValue;
    String stateValue;
    String cityValue;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          Username(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Email(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Firstname(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Lastname(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Cellphone(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Add Addresses",
            press: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text('Addresses'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              SelectState(
                                onCountryChanged: (value) {
                                  setState(() {
                                    countryValue = value;
                                  });
                                },
                                onStateChanged: (value) {
                                  setState(() {
                                    stateValue = value;
                                  });
                                },
                                onCityChanged: (value) {
                                  setState(() {
                                    cityValue = value;
                                  });
                                },
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(30)),
                              buildStreetFormField(),
                              SizedBox(
                                  height: getProportionateScreenHeight(30)),
                              buildZipCodeFormField(),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        DefaultButton(
                          text: "Submit",
                          press: () async {
                            if (_formKey.currentState.validate()) {
                              AddressService as = new AddressService();

                              AddressList address = new AddressList(
                                  street: streetC.text,
                                  city: cityValue,
                                  country: countryValue,
                                  state: stateValue,
                                  zipcode: zipC.text);
                              as.AddAddress(address,
                                  widget.profileModel.customer.id, context);
                              Navigator.pushNamed(
                                  context, ProfileScreen.routeName);
                              /* UserService us = new UserService();
                              us.updateUser(widget.profileModel, context);
                              Navigator.pushNamed(
                                  context, ProfileScreen.routeName);*/
                            }
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Save Changes",
            press: () async {
              if (_formKey.currentState.validate()) {
                UserService us = new UserService();
                us.updateUser(widget.profileModel, context);
                Navigator.pushNamed(context, ProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextEditingController streetC = TextEditingController();
  String street;
  TextFormField buildStreetFormField() {
    return TextFormField(
      controller: streetC,
      onSaved: (newValue) => street = newValue,
      decoration: InputDecoration(
        labelText: "Street",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextEditingController zipC = TextEditingController();
  String zip;
  TextFormField buildZipCodeFormField() {
    return TextFormField(
      controller: zipC,
      onSaved: (newValue) => zip = newValue,
      decoration: InputDecoration(
        labelText: "Zip Code",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextEditingController usernameC = TextEditingController();
  String username;
  TextFormField Username() {
    return TextFormField(
      controller: usernameC..text = '${widget.profileModel.username}',
      onSaved: (newValue) => username = newValue,
      decoration: InputDecoration(
        labelText: "Username:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.accessibility),
      ),
    );
  }

  TextEditingController emailC = TextEditingController();
  String email;
  TextFormField Email() {
    return TextFormField(
      controller: emailC..text = '${widget.profileModel.email}',
      decoration: InputDecoration(
        labelText: "Email:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        suffixIcon: Icon(Icons.email),
      ),
    );
  }

  TextEditingController firstnameC = TextEditingController();
  String firstname;
  TextFormField Firstname() {
    return TextFormField(
      controller: firstnameC
        ..text = '${widget.profileModel.customer.firstName}',
      decoration: InputDecoration(
        labelText: "Firstname:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextEditingController lastnameC = TextEditingController();
  String lastname;
  TextFormField Lastname() {
    return TextFormField(
      controller: lastnameC..text = '${widget.profileModel.customer.lastName}',
      decoration: InputDecoration(
        labelText: "Lastname:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextEditingController cellphoneC = TextEditingController();
  String cellphone;
  TextFormField Cellphone() {
    return TextFormField(
      controller: cellphoneC
        ..text = '${widget.profileModel.customer.phoneNumber}',
      decoration: InputDecoration(
        labelText: "Cellphone:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }
}
