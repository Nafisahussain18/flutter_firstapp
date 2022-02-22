import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/CreateAccount/create_account_screen.dart';

import '../main.dart';

class CreateAccountBloc {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorMsg = "";

  Widget field_fun(TextEditingController Controller_value, String text_field,
      {TextInputType text_type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        keyboardType: text_type,
        controller: Controller_value,
        style: const TextStyle(color: Colors.blue, fontSize: 16),
        decoration: InputDecoration(
            hintText: text_field,
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xff939393)),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Color(0xff939393),
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            )),
      ),
    );
  }

  create_account_validation(BuildContext context) {
    if (nameController.text.isEmpty) {
      errorMsg = "Please enter your name";
    } else if (emailController.text.isEmpty) {
      errorMsg = "You must enter your email address";
    } else if (phoneController.text.isEmpty) {
      errorMsg = "You must enter your phone number";
    } else if (passwordController.text.isEmpty) {
      errorMsg = "You must enter password";
    } else {
      errorMsg = "";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainContainer()),
      );
    }
  }
}
