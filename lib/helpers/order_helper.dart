import 'package:chops/models/order_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderHelper {
  static final _accessToDB = FirebaseFirestore.instance.collection("orders");
  static Future<void> addOrder(Map<String, dynamic> data) async {
    await _accessToDB.add(data);
  }

  static Stream<QuerySnapshot<OrderItem>> getOrders() {
    return _accessToDB
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('date', descending: true)
        .withConverter<OrderItem>(
            fromFirestore: (snapshot, _) => OrderItem.fromFirestore(
                snapshot.data() as Map<String, dynamic>, snapshot.id),
            toFirestore: (_, __) => {})
        .snapshots();
  }

  static Future<void> deleteOrder(OrderItem order) {
    return _accessToDB
        .doc(order.id)
        .delete();
  }
}
