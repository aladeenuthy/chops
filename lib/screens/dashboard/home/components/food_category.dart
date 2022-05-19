import 'package:chops/helpers/product_helper.dart';
import 'package:chops/screens/dashboard/components/food_card.dart';
import 'package:chops/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../models/product.dart';

class FoodCategory extends StatelessWidget {
  final String categoryName;
  const FoodCategory({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Product>>(
        stream: ProductHelper.getProductByCategory(categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.size,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return FoodCard(
                  product: snapshot.data!.docs[index].data(),
                );
              },
            );
          } else {
            return Container();
          }
        });
  }
}
