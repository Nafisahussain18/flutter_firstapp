import 'package:flutter/material.dart';
import 'package:resturent_app11/models/productItem.dart';

class Singleton {
  static final Singleton preferance = Singleton();

  List<ProductItemModel> productList = [
    ProductItemModel(
        name: "watermelon",
        price: 15.00,
        image: "assets/images/productImg1.png",
        image_1: "assets/images/shape1.png",
        image_2: "assets/images/ice-cream1.png",
        color: [const Color(0xffF45D7E), const Color(0xffEC90E8)]),
    ProductItemModel(
        name: "mango",
        price: 52.00,
        image: "assets/images/productImg2.png",
        image_1: "assets/images/shape2.png",
        image_2: "assets/images/ice-cream2.png",
        color: [const Color(0xffFFB13B), const Color(0xffFEEA93)]),
    ProductItemModel(
        name: "blueburry",
        price: 55.00,
        image: "assets/images/productImg3.png",
        image_1: "assets/images/shape3.png",
        image_2: "assets/images/ice-cream3.png",
        color: [const Color(0xffA076E8), const Color(0xffB1C4F8)]),
    ProductItemModel(
        name: "avocado",
        price: 55.30,
        image: "assets/images/productImg4.png",
        image_1: "assets/images/shape4.png",
        image_2: "assets/images/ice-cream4.png",
        color: [const Color(0xff5CCD92), const Color(0xffBFE89C)]),
    ProductItemModel(
        name: "grape",
        price: 15.00,
        image: "assets/images/productImg5.png",
        image_1: "assets/images/shape5.png",
        image_2: "assets/images/ice-cream5.png",
        color: [const Color(0xffA86FDA), const Color(0xffF5B9D5)]),
    ProductItemModel(
        name: "Strawberry",
        price: 52.00,
        image: "assets/images/productImg6.png",
        image_1: "assets/images/shape1.png",
        image_2: "assets/images/ice-cream6.png",
        color: [const Color(0xffD42E2E), const Color(0xffEC90E8)]),
    ProductItemModel(
        name: "apple",
        price: 85.00,
        image: "assets/images/productImg7.png",
        image_1: "assets/images/shape6.png",
        image_2: "assets/images/ice-cream7.png",
        color: [const Color(0xffFD9B8D), const Color(0xffFBA6C6)]),
    ProductItemModel(
        name: "cocktail",
        price: 85.00,
        image: "assets/images/productImg8.png",
        image_1: "assets/images/shape1.png",
        image_2: "assets/images/ice-cream8.png",
        color: [const Color(0xffF4787C), const Color(0xffFEEA93)]),
  ];
}
