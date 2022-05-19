import 'package:chops/models/cart_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrderItem {
  final String id;
  final DateTime date;
  final double total;
  final String state;
  final List<CartItem> cartItems;

  String get formatedDate {
    return DateFormat.yMMMd().format(date);
  }

  OrderItem(
      {required this.id,
      required this.date,
      required this.total,
      required this.state,
      required this.cartItems});

  factory OrderItem.fromFirestore(Map<String, dynamic> data, String id) {
    final cartItemList = List<Map<String, dynamic>>.from(data['cartItems']);
    final convertCartList = cartItemList
        .map((cartItem) => CartItem.fromFirestore(cartItem, ''))
        .toList();
    final Timestamp date = data['date'];
    return OrderItem(
        id: id,
        date: DateTime.parse(date.toDate().toString()),
        state: data['state'],
        total: data['total'],
        cartItems: convertCartList);
  }
}
