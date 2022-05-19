import 'package:chops/helpers/order_helper.dart';
import 'package:chops/models/order_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<OrderItem>>(
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
                  itemBuilder: (_, index) =>
                      OrderTIle(order: snapshot.data!.docs[index].data()),
                );
              }
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/no_history.png'),
                    const Text(
                      "No history yet",
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

class OrderTIle extends StatelessWidget {
  final OrderItem order;
  const OrderTIle({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (dir) {},
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(order.formatedDate),
          subtitle: Text(
            order.state,
            style: const TextStyle(color: primaryColor, fontSize: 15),
          ),
          trailing: Text("N${order.total.toStringAsFixed(1)}"),
        ),
      ),
    );
  }
}
