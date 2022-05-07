import 'package:chops/screens/auth/auth.dart';
import 'package:chops/screens/dashboard/dashboard.dart';
import 'package:chops/screens/dashboard/home_screen.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:chops/screens/welcome_screen/splash_screen.dart';
import 'package:chops/screens/welcome_screen/welcome_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: bgColor,
          elevation: 0
        ),
        scaffoldBackgroundColor: bgColor,
        colorScheme: ThemeData().colorScheme.copyWith(primary: greyColor),
        inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: greyColor, fontWeight: FontWeight.bold, fontSize: 19
          )
      )),
      home: const FoodDetailsScreen(),
    );
  }
}

