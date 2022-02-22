import 'package:flutter/material.dart';
import 'package:resturent_app11/models/productItem.dart';
import 'package:resturent_app11/screens/payment_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';

class CartScreen extends StatefulWidget {
  final List<ProductItemModel> listOfProduct;
  final Function(List<ProductItemModel>) newList;
  bool commingFromTab;

  CartScreen(
      {required this.listOfProduct,
      required this.newList,
      this.commingFromTab = true,
      Key? key})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.commingFromTab
          ? null
          : ourCutomAppBar(context, showBackButton: true, title: "My Cart",
              backButtonPressed: () {
              widget.newList(widget.listOfProduct);
            }),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: widget.listOfProduct.length,
                itemBuilder: (ctx, index) {
                  return productTile(widget.listOfProduct[index], index);
                }),
          ),
          Container(
            color: Colors.white,
            height: 340,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("Your Orders",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const Divider(color: Colors.grey),
                  columnlist('Bill Totals', getBillTotal()),
                  const Divider(color: Colors.grey),
                  columnlist("Discount", "30%"),
                  const Divider(color: Colors.grey),
                  columnlist("Grand Total", grantTotal(getBillTotal())),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.pink),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => payment()));
                      },
                      child: const Text("Proceed to pay")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget productTile(ProductItemModel model, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 131,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    model.image,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(model.name,
                          style: const TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          const Icon(Icons.check_circle_outline),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("200ml, 1x ₹ ${model.price}",
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      widget.listOfProduct.removeAt(index);
                      setState(() {});
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.red,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (model.qty == 1) {
                          widget.listOfProduct.removeAt(index);
                        }
                        model.qty--;
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_circle_outline)),
                  Text(model.qty.toString()),
                  IconButton(
                      onPressed: () {
                        model.qty++;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add_circle_outline)),
                  Expanded(child: Container()),
                  Text(" ₹" + (model.qty * model.price).toStringAsFixed(2),
                      style: const TextStyle(color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getBillTotal() {
    double total = 0;

    for (ProductItemModel model in widget.listOfProduct) {
      total = total + (model.qty * model.price);
    }

    return total.toStringAsFixed(2);
  }

  String grantTotal(String total) {
    var doubleTotal = double.parse(total);
    return (doubleTotal * 70 / 100).toStringAsFixed(2);
  }
}

Widget columnlist(String title, String amount) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0, bottom: 12, left: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
        const SizedBox(
          width: 170,
        ),
        Text(amount),
      ],
    ),
  );
}
