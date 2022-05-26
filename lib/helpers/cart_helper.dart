import 'dart:io';

import 'package:chops/helpers/key_helper.dart';
import 'package:chops/helpers/order_helper.dart';
import 'package:chops/models/cart_item.dart';
import 'package:chops/models/product.dart';
import 'package:chops/utils/constants.dart';
import 'package:chops/utils/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter/material.dart';

class CartHelper {
  static final _accessToDB = FirebaseFirestore.instance.collection('cart');
  static Future<void> addToCart(Product product, int quantity) async {
    final cartItem = await _accessToDB
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cartItems')
        .doc(product.id)
        .get();
    if (cartItem.exists) {
      showSnackBar("item already in cart");
    } else {
      await _accessToDB
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cartItems')
          .doc(product.id)
          .set({
        'name': product.name,
        'image': product.images[0],
        'price': product.price,
        'quantity': quantity,
        'date': Timestamp.now()
      });
      showSnackBar('item added to cart', false);
    }
  }

  static Future<void> removeItemFromCart(String cartId) async {
    await _accessToDB
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cartItems')
        .doc(cartId)
        .delete();
    showSnackBar('item removed from cart', false);
  }

  static Stream<QuerySnapshot<CartItem>> getCartItems() {
    return _accessToDB
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cartItems')
        .orderBy('date', descending: true)
        .withConverter(
            fromFirestore: (snapshot, _) => CartItem.fromFirestore(
                snapshot.data() as Map<String, dynamic>, snapshot.id),
            toFirestore: (_, __) => {})
        .snapshots();
  }

  static Future<void> clearCart() async {
    final batch = FirebaseFirestore.instance.batch();
    var snapshots = await _accessToDB
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cartItems')
        .get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  static Future<void> makePayment(
      double total, List<Map<String, dynamic>> cartItems) async {
    final plugin = PaystackPlugin();
    await plugin.initialize(publicKey: paystackPublickKey);
    Charge charge = Charge()
      ..amount = total.toInt() * 100
      ..reference = _getReference()
      ..email = FirebaseAuth.instance.currentUser!.email;
    CheckoutResponse response =
        await plugin.checkout(KeyHelper.appNavKey.currentState!.context,
            method: CheckoutMethod.card,
            charge: charge,
            logo: Image.asset(
              'assets/images/foodie_logo.png',
              height: 50,
            ));
    if (response.status == true) {
      await clearCart();
      Map<String, dynamic> data = {
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'date': Timestamp.now(),
        'total': total,
        'state': 'pending',
        'cartItems': cartItems
      };
      OrderHelper.addOrder(data);
      return;
    }
  }
}

String _getReference() {
  String platform;
  if (Platform.isIOS) {
    platform = 'iOS';
  } else {
    platform = 'Android';
  }

  return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
}
