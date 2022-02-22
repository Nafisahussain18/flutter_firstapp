import 'dart:async';

import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/payment_success.dart';
import 'package:resturent_app11/screens/payment_success.dart';

class SplashState extends StatefulWidget {
  SplashState({Key? key}) : super(key: key);

  @override
  State<SplashState> createState() => _SplashStateState();
}

class _SplashStateState extends State<SplashState> {
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
        context, MaterialPageRoute(builder: (context) => payment_success()));
  }

  initScreen(BuildContext context) {}
}
