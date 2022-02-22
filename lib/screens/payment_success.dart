import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/LoginPage/login_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';
import 'package:resturent_app11/screens/Splash_screen.dart';

class payment_success extends StatefulWidget {
  payment_success({Key? key}) : super(key: key);

  @override
  State<payment_success> createState() => _payment_successState();
}

class _payment_successState extends State<payment_success> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/payment_success.png"),
            const SizedBox(height: 8),
            const Text("Payment Success!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Thank You..", style: TextStyle(fontSize: 22))
          ],
        ),
      ),
    );
  }
}
