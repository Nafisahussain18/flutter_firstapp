import 'package:flutter/material.dart';

class CartItemModel {
  String name;
  int qty;
  double price;
  String image;
  List<Color> color;

  CartItemModel(
      {required this.name,
      required this.price,
      required this.color,
      required this.image,
      this.qty = 0});
}
