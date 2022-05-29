import 'package:chops/helpers/product_helper.dart';
import 'package:chops/models/product.dart';
import 'package:chops/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/food_card.dart';

class FavoritiesScreen extends StatelessWidget {
  const FavoritiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Product>>(
          stream: ProductHelper.getFavorites(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  backgroundColor: Colors.black,
                ),
              );
            } else if (snapshot.hasData) {
              return SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: FoodCard(product: snapshot.data!.docs[index].data()),
                        ),
                    itemCount: snapshot.data!.size,
                  ));
            }
            return Container();
          }),
    );
  }
}
