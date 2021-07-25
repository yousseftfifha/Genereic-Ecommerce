import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
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
