
import 'package:chops/helpers/key_helper.dart';
import 'package:chops/screens/auth/auth_screen.dart';
import 'package:chops/screens/dashboard/dashboard.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';

import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: KeyHelper.appNavKey,
      scaffoldMessengerKey: KeyHelper.scafKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          primary: primaryColor,
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
      home: const  AuthScreen(),
      routes: {
        FoodDetailsScreen.routeName: (context) => FoodDetailsScreen()
      },
    );
  }
}

