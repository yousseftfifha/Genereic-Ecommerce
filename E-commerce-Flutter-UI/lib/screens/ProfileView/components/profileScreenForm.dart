import 'dart:convert';
import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/models/Customer.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProfileScreenForm extends StatefulWidget {

  get url => null;


  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

User profileModel = User();
Customer customer = Customer();

Future<User> fetchData() async {
  String email = "";

    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('username');
    print(email);

  var data = await http.get('http://localhost:8081/api/Users/username/'+email.toString());
  var jsonData = json.decode(data.body);
  profileModel.id = jsonData["id"];
  profileModel.username = jsonData["username"];
  profileModel.email = jsonData["email"];
  customer.id = jsonData["customer"]["id"];
  customer.firstname = jsonData["customer"]["firstName"];
  customer.lastname = jsonData["customer"]["lastName"];
  customer.cellphone = int.parse(jsonData["customer"]["phoneNumber"]);
  customer.gender = jsonData["customer"]["gender"];
  customer.url = jsonData["customer"]["url"];
  customer.dateOfBirth = DateTime.parse(DateFormat('yyyy-MM-dd')
      .format(DateTime.parse(jsonData["customer"]["dateOfBirth"])));

  profileModel.customer = customer;

  return profileModel;
}

class _CompleteProfileFormState extends State<ProfileScreenForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  DateTime selectedDate = DateTime.now();
  TextEditingController username = TextEditingController();

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
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    var Url = 'http://localhost:8081/uploadFile/customer/'+'${profileModel.customer.id}'.toString() ;
    var response = await http.put(Url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode({'url': _image}));
    String responseString = response.body;
    print(responseString);

  }
  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      Navigator.pop(context);
    });
  }
  Future<String> uploadImage(filename, url) async {
    var Url = 'http://localhost:8081/uploadFile/customer/'+'${profileModel.customer.id}'.toString() ;

    var request = http.MultipartRequest('PUT', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('file', filename));
    var res = await request.send();
    return res.reasonPhrase;
    // var res = await http.put(url,
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode({'file': username, 'password': password}));
    // print(res.body);
    // final int statusCode = res.statusCode;
    // print(statusCode);
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  TextField Username() {
    return TextField(
      enabled: false,
      controller: TextEditingController()
        ..text = '${profileModel.username}',
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
        ..text = '${profileModel.email}',
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
        ..text = '${profileModel.customer.firstname}',
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
        ..text = '${profileModel.customer.lastname}',
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
        ..text = '${profileModel.customer.cellphone}',
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
        ..text = '${profileModel.customer.gender}',
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
        ..text = '${profileModel.customer.dateOfBirth}',
      decoration: InputDecoration(
        labelText: "Date of birth:",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today),
      ),
    );
  }

  String state = "";

  SizedBox ProfilePic1() {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
           child: Image.network('${profileModel.customer.url}'),
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
                onPressed: ()  async {
                  var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                  if(file.path!=null){
                  var res = await uploadImage(file.path, widget.url);
                  setState(() {
                    state = res;
                    print(res);
                  });}
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