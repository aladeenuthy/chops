import 'package:chops/models/order_item.dart';
import 'package:chops/screens/cart/components/cart_tile.dart';
import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget {
  static const routeName = "order/view-order";
  final OrderItem orderItem;
  const ViewOrder({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              minimumSize: const Size(0, 0)),
                          onPressed: () {},
                          child:
                              Text("N${orderItem.total.toStringAsFixed(1)}")),
                      const SizedBox(width: 10),
                      Text("${orderItem.cartItems.length} items")
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: 500,
                  child: ListView.builder(
                      itemCount: orderItem.cartItems.length,
                      itemBuilder: (_, index) =>
                          CartTile(cartItem: orderItem.cartItems[index], dismiss: false,),))
            ],
          ),
        ),
      ),
    );
  }
}
