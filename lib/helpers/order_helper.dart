import 'package:chops/models/order_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderHelper {
  static Future<void> addOrder(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('orders').add(data);
  }

  static Stream<QuerySnapshot<OrderItem>> getOrders() {
    return FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).orderBy('date', descending: true).withConverter<OrderItem>(fromFirestore: (snapshot,_) => OrderItem.fromFirestore(snapshot.data() as Map<String, dynamic>, snapshot.id), toFirestore:(_, __) => {})
        .snapshots();
  }
}
