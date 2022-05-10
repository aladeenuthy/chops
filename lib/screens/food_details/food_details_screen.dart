import 'dart:math';

import 'package:chops/screens/food_details/components/section.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  final pageController = PageController();
  double n = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: blackColor,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: blackColor,
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
              child: PageView(
                controller: pageController,
                children: [
                  Image.asset(
                    "assets/images/food_1.png",
                  ),
                  Image.asset("assets/images/food_2.png"),
                  Image.asset(
                    "assets/images/food_3.png",
                  ),
                  Image.asset(
                    "assets/images/food_3.png",
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: 25,
                child: SmoothPageIndicator(
                    controller: pageController, // PageController
                    count: 4,
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
            const Center(
                child: Text(
              "Egg and cucumber sauce",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
            const Center(
              child: Text("N1900.0",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.bold)),
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
                setState(() {
                  n += .1;
                });
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
