import 'package:flutter/material.dart';

import 'package:resturent_app11/screens/home_screen.dart';
import 'package:resturent_app11/screens/profile_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';

import 'cart_screen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ourCutomAppBar(context, backButtonPressed: () {}),
      body: slectedTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        iconSize: 30,
        selectedItemColor: Color(0xffA7BBDB),
        unselectedItemColor: Color(0xffD3D8E0),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget slectedTab() {
    if (selectedIndex == 0) {
      return HomeScreen();
    } else if (selectedIndex == 1) {
      return CartScreen(
        listOfProduct: [],
        newList: (list) {},
      );
    } else {
      return ProfileScreen();
    }
  }
  //HERE

}
