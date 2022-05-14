import 'package:flutter/material.dart';

import 'components/food_card.dart';

class FavoritiesScreen extends StatelessWidget {
  const FavoritiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [FoodCard(), FoodCard(), FoodCard()],
          ),
        ),
      ),
    );
  }
}
