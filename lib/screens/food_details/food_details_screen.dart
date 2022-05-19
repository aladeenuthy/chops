import 'dart:math';

import 'package:chops/helpers/cart_helper.dart';
import 'package:chops/helpers/product_helper.dart';
import 'package:chops/models/product.dart';
import 'package:chops/screens/food_details/components/section.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetailsScreen extends StatefulWidget {
  final Product product;
  const FoodDetailsScreen({Key? key, required this.product}) : super(key: key);
  static const routeName = "/food-details";

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  bool _isFavorite = false;
  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
  }

  @override
  void dispose() {
    pageController.dispose();
    if (_isFavorite != widget.product.isFavorite) {
      ProductHelper.toggleFavorite(
          widget.product.id, widget.product.isFavorite);
    }
    super.dispose();
  }

  final pageController = PageController();
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: blackColor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: primaryColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 180,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.product.images.length,
                  itemBuilder: (_, index) =>
                      Image.network(widget.product.images[index])),
            ),
            Center(
              child: SizedBox(
                height: 25,
                child: SmoothPageIndicator(
                    controller: pageController, // PageController
                    count: widget.product.images.length,
                    effect: const JumpingDotEffect(
                      activeDotColor: primaryColor,
                      dotWidth: 15,
                      dotHeight: 10,
                    ), // your preferred effect
                    onDotClicked: (index) {}),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              widget.product.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
            Center(
              child: Text("N${widget.product.price.toStringAsFixed(1)}",
                  style: const TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RawMaterialButton(
                    splashColor: primaryColor,
                    onPressed: () {
                      if (quantity == 1) {
                        return;
                      }
                      setState(() {
                        quantity -= 1;
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 25,
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                        side: BorderSide(color: primaryColor, width: 2))),
                Text(
                  quantity.toString(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                RawMaterialButton(
                    splashColor: primaryColor,
                    onPressed: () {
                      setState(() {
                        quantity += 1;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.all(15),
                    shape: const CircleBorder(
                        side: BorderSide(color: primaryColor, width: 2))),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Section(),
            const SizedBox(
              height: 20,
            ),
            const Section(),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                CartHelper.addToCart(widget.product, quantity);
              },
              child: const Text(
                "Add to cart",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
