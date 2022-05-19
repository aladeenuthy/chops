import 'package:chops/models/product.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Product product;
  const FoodCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(FoodDetailsScreen.routeName, arguments: product),
      child: Container(
        height: 220,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("N${product.price.toStringAsFixed(1)}",
                        style: const TextStyle(
                            color: primaryColor, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                child: Image.network(
                  product.images[0],
                  height: 160,
                  width: 160,
                ))
          ],
        ),
      ),
    );
  }
}
