
import 'package:chops/helpers/cart_helper.dart';
import 'package:chops/models/cart_item.dart';
import 'package:chops/screens/cart/components/cart_tile.dart';
import 'package:chops/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                CartHelper.clearCart();
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: StreamBuilder<QuerySnapshot<CartItem>>(
          stream: CartHelper.getCartItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.size > 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CartSummary(
                        cartItems: snapshot.data!.docs,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemBuilder: (_, index) => CartTile(
                            cartItem: snapshot.data!.docs[index].data(),dismiss: true,),
                        itemCount: snapshot.data!.size,
                      ))
                    ],
                  ),
                );
              }
                return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/no_orders.png'),
                    const Text(
                      "cart empty",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}

class CartSummary extends StatelessWidget {
  final List<QueryDocumentSnapshot<CartItem>> cartItems;

  const CartSummary({Key? key, required this.cartItems}) : super(key: key);
  double getTotal() {
    return cartItems.fold<double>(
        0.0,
        (previousValue, element) =>
            previousValue + element.data().price * element.data().quantity);
  }

  @override
  Widget build(BuildContext context) {
    final total = getTotal();
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      child: Row(children: [
        const Text("Total"),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                minimumSize: const Size(0, 0)),
            onPressed: () {},
            child: Text("N$total")),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            List<Map<String, dynamic>> cartItemsJson = cartItems
                .map((cartSnapshot) => cartSnapshot.data().toJson())
                .toList();
            CartHelper.makePayment(total, cartItemsJson);
          },
          child: const Text("Order now"),
        )
      ]),
    );
  }
}
