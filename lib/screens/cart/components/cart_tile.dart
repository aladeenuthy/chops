import 'package:chops/helpers/cart_helper.dart';
import 'package:chops/models/cart_item.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final bool dismiss;
  final CartItem cartItem;
  const CartTile({Key? key, required this.cartItem, required this.dismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (dir) {
        CartHelper.removeItemFromCart(cartItem.id);
      },
      direction: dismiss ?  DismissDirection.endToStart : DismissDirection.none,
      key: ValueKey(cartItem.id),
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
          leading: Image.network(
            cartItem.image,
            height: 50,
          ),
          title: Text(cartItem.name),
          subtitle: Text(
            "N${cartItem.price.toStringAsFixed(1)}",
            style: const TextStyle(color: primaryColor, fontSize: 15),
          ),
          trailing: Text("x${cartItem.quantity}"),
        ),
      ),
    );
  }
}
