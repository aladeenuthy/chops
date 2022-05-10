import 'package:chops/components/no_internet_screen.dart';
import 'package:chops/components/welcome_screen.dart';
import 'package:chops/screens/auth/auth.dart';
import 'package:chops/screens/dashboard/dashboard.dart';
import 'package:chops/screens/dashboard/history_screen.dart';
import 'package:chops/screens/dashboard/home_screen.dart';
import 'package:chops/screens/dashboard/profile_screen.dart';
import 'package:chops/screens/dashboard/res.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:chops/screens/orders/orders_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

import 'screens/dashboard/favorites_screen.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 53),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
        )))
        ,
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
      home: const DashBoard(),
    );
  }
}

