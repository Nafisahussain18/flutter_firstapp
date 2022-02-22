import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/main.dart';

class LoginBloc {
  String errorMsg = "";

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateLoginField(BuildContext context) {
    if (userNameController.text.isEmpty) {
      errorMsg = "Username is empty";
    } else if (passwordController.text.isEmpty) {
      errorMsg = "Password is empty";
    } else if (userNameController.text != "abed") {
      errorMsg = "Username Not Correct";
    } else if (passwordController.text != "123") {
      errorMsg = "Password Not Correct";
    } else {
      errorMsg = "";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    }
  }

  Widget divider() {
    return Container(
      color: Colors.grey,
      height: 20,
      width: 1,
    );
  }

  Widget url_space(String urlName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          urlName,
          style: const TextStyle(color: Color(0xffF05F5F), fontSize: 11),
        ),
      ),
    );
  }

  Widget text_Button(BuildContext context, String text,
      {required Function funName}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => funName()),
        );
      },
      child: Text(
        text,
        style: const TextStyle(color: Color(0xff939393), fontSize: 13),
      ),
    );
  }
}
