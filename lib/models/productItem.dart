import 'package:flutter/material.dart';

class ProductItemModel {
  String name;
  int qty;
  double price;
  String image;
  String image_1;
  String image_2;
  List<Color> color;
  double rating;

  ProductItemModel(
      {required this.name,
      required this.price,
      required this.color,
      required this.image,
      required this.image_1,
      required this.image_2,
      this.qty = 0,
      this.rating = 0});
}
