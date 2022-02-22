import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/CreateAccount/create_account_bloc.dart';
import 'package:resturent_app11/screens/LoginPage/login_screen.dart';
import 'package:resturent_app11/screens/main.dart';
import 'package:url_launcher/url_launcher.dart';

const facebookurl = 'https://www.facebook.com/';
const googleurl = 'https://www.google.com';
const twitterurl = 'https://www.twitter.com';

class Register extends StatefulWidget {
  Register() : super();

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var mybloc = CreateAccountBloc();

  //create suffix eye to show and hide the password
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 110),
              child: Text(
                "Register",
                style: TextStyle(fontSize: 16, color: Color(0xff747474)),
              ),
            ),
            mybloc.field_fun(mybloc.nameController, 'Name'),
            mybloc.field_fun(mybloc.emailController, 'Email',
                text_type: TextInputType.emailAddress),
            mybloc.field_fun(mybloc.phoneController, 'Mobile',
                text_type: TextInputType.phone),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                obscureText: _obscureText,
                autocorrect: false,
                obscuringCharacter: "*",
                controller: mybloc.passwordController,
                style: const TextStyle(fontSize: 16, color: Colors.blue),
                decoration: InputDecoration(
                    hintText: "Create Password",
                    hintStyle: const TextStyle(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xff939393)),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
            ),
            ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.only(left: 150, right: 150)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ))),
              onPressed: () {
                mybloc.create_account_validation(context);
                setState(() {});
              },
            ),
            Text(mybloc.errorMsg),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextButton(
                      onPressed: () {
                        launchURL(googleurl);
                      },
                      child: const Text(
                        "Google",
                        style:
                            TextStyle(color: Color(0xffF05F5F), fontSize: 11),
                      )),
                ),
                Container(
                  width: 1.5,
                  height: 25,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextButton(
                      onPressed: () {
                        launchURL(facebookurl);
                      },
                      child: const Text(
                        "FaceBook",
                        style:
                            TextStyle(color: Color(0xff3884C6), fontSize: 11),
                      )),
                ),
                Container(
                  width: 1.5,
                  height: 25,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextButton(
                      onPressed: () {
                        launchURL(twitterurl);
                      },
                      child: const Text(
                        "Twitter",
                        style:
                            TextStyle(color: Color(0xff4CAAFC), fontSize: 11),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Text("Already have an account?", style: loginfont()),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Login", style: loginfont()),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

void launchURL(_url) async {
  if (_url == googleurl) {
    if (!await launch(googleurl)) throw 'Could not launch $googleurl';
  } else if (_url == twitterurl) {
    if (!await launch(twitterurl)) throw 'Could not launch $twitterurl';
  } else if (_url == facebookurl) {
    if (!await launch(facebookurl)) throw 'Could not launch $facebookurl';
  }
}

TextStyle loginfont() {
  return const TextStyle(fontSize: 13, color: Color(0xff939393));
}
