import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/models/User.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/services/AddressService.dart';
import 'package:shop_app/services/UserService.dart';

import '../../../size_config.dart';

class ProfileScreenForm extends StatefulWidget {
  final User profileModel;

  const ProfileScreenForm({Key key, @required this.profileModel})
      : super(key: key);
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<ProfileScreenForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    AddressService as = new AddressService();
    return Form(
      key: _formKey,
      child: Column(children: [
        SizedBox(height: 20),
        ProfilePic1(),
        SizedBox(height: 20),
        Username(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Email(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Firstname(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Lastname(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Gender(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Cellphone(),
        SizedBox(height: getProportionateScreenHeight(30)),
        Datebirth(),
        SizedBox(height: getProportionateScreenHeight(30)),
        SizedBox(height: getProportionateScreenWidth(20)),
        ...List.generate(widget.profileModel.customer.addressList.length,
            (index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: Text('Address N°:' + index.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Country :' +
                        '${widget.profileModel.customer.addressList[index].country}' +
                        '\n State:' +
                        '${widget.profileModel.customer.addressList[index].state}' +
                        '\n City:' +
                        '${widget.profileModel.customer.addressList[index].city}' +
                        '\n Street:' +
                        '${widget.profileModel.customer.addressList[index].street}' +
                        '\n ZipCode:' +
                        '${widget.profileModel.customer.addressList[index].zipcode}',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child:
                          const Text(' Make this address default for delivery'),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }

  TextField Username() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${widget.profileModel.username}',
      decoration: InputDecoration(
        labelText: "Username:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.accessibility),
      ),
    );
  }

  TextField Email() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${widget.profileModel.email}',
      decoration: InputDecoration(
        labelText: "Email:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

        suffixIcon: Icon(Icons.email),
      ),
    );
  }

  TextField Firstname() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
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

  TextField Lastname() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${widget.profileModel.customer.lastName}',
      decoration: InputDecoration(
        labelText: "Lastname:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextField Cellphone() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
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

  TextField Gender() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${widget.profileModel.customer.gender}',
      decoration: InputDecoration(
        labelText: "Gender:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.male),
      ),
    );
  }

  TextField Datebirth() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${widget.profileModel.customer.dateOfBirth}',
      decoration: InputDecoration(
        labelText: "Date of birth:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today),
      ),
    );
  }

  SizedBox ProfilePic1() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            child: Image.network('${widget.profileModel.customer.url}'),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                color: Color(0xFFF5F6F9),
                onPressed: () async {
                  var file =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  if (file.path != null) {
                    UserService us = UserService();
                    var res = await us.uploadImage(
                        file.path, widget.profileModel.customer.id);
                    setState(() {
                      us.fetchData();
                    });
                  }
                },
                // child: Icon(Icons.add),
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
