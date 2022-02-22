import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/payment_success.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class payment extends StatefulWidget {
  payment();
  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  int active_index = 1;
  final controller = PageController(viewportFraction: 0.8);
  final pathImage = [
    'assets/images/master_card.png',
    'assets/images/visa_card.png',
    'assets/images/cart.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      appBar: ourCutomAppBar(context,
          title: 'payment', showBackButton: true, backButtonPressed: () {}),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: pathImage.length,
            itemBuilder: (context, index, realIndex) {
              final Image_path = pathImage[index];
              return buildImages(Image_path, index);
            },
            options: CarouselOptions(
                height: 250,
                initialPage: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) =>
                    setState(() => active_index = index)),
          ),
          const SizedBox(height: 20),
          buildIndicator(),
          const SizedBox(height: 40),
          Container(
            width: 310,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      'Payment Options',
                      style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Credit / Debit Card',
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                  const Divider(color: Colors.grey),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Payment Gateways',
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                  const Divider(color: Colors.grey),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Cash On Delivery',
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 40),
                  Container(
                    decoration: const BoxDecoration(
                        gradient: RadialGradient(colors: [
                          Color.fromARGB(255, 109, 193, 231),
                          Colors.blue
                        ], radius: 1.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text('Payment Amount',
                                style: TextStyle(
                                    fontSize: 9, color: Colors.white)),
                            Text('\$150.0',
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => payment_success()));
                            },
                            child: const Text(
                              'Pay',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget buildImages(String image_path, int index) => Container(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset(
          image_path,
          scale: 0.5,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: active_index,
        count: pathImage.length,
        effect: const SlideEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 24.0,
            dotHeight: 1.5,
            dotColor: Colors.grey,
            paintStyle: PaintingStyle.stroke,
            activeDotColor: Colors.blue),
      );
}
