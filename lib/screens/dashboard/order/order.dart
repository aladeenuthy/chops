import 'package:chops/helpers/order_helper.dart';
import 'package:chops/models/order_item.dart';
import 'package:chops/screens/cart/components/cart_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<QuerySnapshot<OrderItem>>(
          stream: OrderHelper.getOrders(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data!.size > 0) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: snapshot.data!.size,
                  itemBuilder: (_, index) => OrderTIle(order: snapshot.data!.docs[index].data()),
                );
              }
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/no_orders.png'),
                    const Text(
                      "No orders yet",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            }
            return Container();
          });
  }
}

class OrderTIle extends StatelessWidget {
  final OrderItem order;
  const OrderTIle({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (dir) {
        OrderHelper.deleteOrder(order);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(order.id),
      background: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          )),
      child: Column(
        children: [
          ExpansionTile(
            key:  PageStorageKey<String>(order.id),    
            title: Text("N${order.total.toStringAsFixed(1)}"),
            leading:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 13,),
                Text(order.formatedDate),
                Text(
                order.state,
                style: const TextStyle(color: primaryColor, fontSize: 15),
              ),
            
              ],
            ),
            children: order.cartItems.map((cartItem) => CartTile(cartItem: cartItem, dismiss: false)).toList(),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
