import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resturent_app11/models/productItem.dart';
import 'package:resturent_app11/screens/cart_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  List<ProductItemModel> listOfProduct;
  ProductItemModel product;
  int selectedIndex;

  ProductDetails(this.product, this.listOfProduct, this.selectedIndex);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourCutomAppBar(context,
          title: widget.product.name,
          showBackButton: true,
          backButtonPressed: () {}),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: widget.listOfProduct.length,
              onPageChanged: (index) {},
              controller: PageController(
                  initialPage: widget.selectedIndex, viewportFraction: 0.8),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: widget.listOfProduct[index].color),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Image.asset(
                              widget.listOfProduct[index].image,
                              scale: 0.45,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.listOfProduct[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 3),
                                Text(
                                  "200ml, 1x ₹" +
                                      widget.listOfProduct[index].price
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Divider(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 17.0, right: 30.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (widget.listOfProduct[index].qty ==
                                          0) {
                                        return;
                                      }
                                      widget.listOfProduct[index].qty--;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    widget.listOfProduct[index].qty.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      widget.listOfProduct[index].qty++;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "₹" +
                                        (widget.listOfProduct[index].qty *
                                                widget
                                                    .listOfProduct[index].price)
                                            .toStringAsFixed(2),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      RatingBar.builder(
                        initialRating: widget.listOfProduct[index].rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          widget.listOfProduct[index].rating = rating;
                          setState(() {});
                        },
                      ),
                      Text("You Have Rate " +
                          widget.listOfProduct[index].rating.toString() +
                          " Stars")
                    ],
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              List<ProductItemModel> newList = [];

              for (ProductItemModel model in widget.listOfProduct) {
                if (model.qty > 0) {
                  newList.add(model);
                }
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    listOfProduct: newList,
                    commingFromTab: false,
                    newList: (list) {
                      for (ProductItemModel mainList in widget.listOfProduct) {
                        for (ProductItemModel subList in widget.listOfProduct) {
                          if (mainList.name == subList.name) {
                            mainList.qty = subList.qty;
                          }
                        }
                      }
                      setState(() {});
                    },
                  ),
                ),
              );
            },
            child: Container(
              height: 41,
              width: 146,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffF45D7E), Color(0xffEC90E8)]),
              ),
              child: const Center(
                child: Text(
                  "Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
