import 'package:chops/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductHelper {
  static final _accessToDB = FirebaseFirestore.instance.collection('products');
  static Stream<QuerySnapshot<Product>> search(String text) {
    return _accessToDB
        .where("name", isGreaterThanOrEqualTo: text)
        .where("name", isLessThanOrEqualTo: "$text\uf7ff")
        .withConverter<Product>(
            fromFirestore: (snapshot, _) {
              return Product.fromFirestore(
                  snapshot.data() as Map<String, dynamic>, snapshot.id, true);
            },
            toFirestore: (_, __) => {})
        .snapshots();
  }

  static Future<void> toggleFavorite(String productId, bool isFavorite) async {
    _accessToDB.doc(productId).update({
      'usersFavorited': isFavorite
          ? FieldValue.arrayRemove([FirebaseAuth.instance.currentUser!.uid])
          : FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid])
    });
  }

  static Stream<QuerySnapshot<Product>> getFavorites() {
    return FirebaseFirestore.instance
        .collection('products')
        .where('usersFavorited',
            arrayContains: FirebaseAuth.instance.currentUser!.uid)
        .withConverter<Product>(
            fromFirestore: (snapshot, _) {
              return Product.fromFirestore(
                  snapshot.data() as Map<String, dynamic>, snapshot.id, true);
            },
            toFirestore: (_, __) => {})
        .snapshots();
  }

  static Stream<QuerySnapshot<Product>> getProductByCategory(String category) {
    return _accessToDB
        .where('category', isEqualTo: category)
        .orderBy('date', descending: true)
        .withConverter<Product>(
            fromFirestore: (snapshot, _) {
              List usersFavorited = snapshot.data()?['usersFavorited'] ?? [];
              return Product.fromFirestore(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                  usersFavorited
                      .contains(FirebaseAuth.instance.currentUser!.uid));
            },
            toFirestore: (_, __) => {})
        .snapshots();
  }
}
