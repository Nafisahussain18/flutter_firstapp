import 'package:flutter/material.dart';

AppBar ourCutomAppBar(BuildContext context,
    {String title = "Jusbar",
    bool showBackButton = false,
    required VoidCallback backButtonPressed}) {
  return AppBar(
    backgroundColor: const Color(0xffFCFCFC),
    title: Text(
      title,
      style: const TextStyle(
        color: Color(0xffA4A4A4),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: showBackButton
        ? IconButton(
            onPressed: () {
              backButtonPressed();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.grey))
        : Container(),
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          color: Color(0xffD3D8E0),
        ),
      ),
    ],
  );
}
