import 'package:chops/components/splash_screen.dart';
import 'package:chops/config/theme.dart';
import 'package:chops/helpers/key_helper.dart';
import 'package:chops/models/product.dart';
import 'package:chops/screens/auth/auth_screen.dart';
import 'package:chops/screens/dashboard/dashboard.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: KeyHelper.appNavKey,
      scaffoldMessengerKey: KeyHelper.scafKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const DashBoard();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        if (settings.name == FoodDetailsScreen.routeName) {
          final Product product = settings.arguments as Product;
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => FoodDetailsScreen(
                    product: product,
                  ));
        }
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const DashBoard());
      },
    );
  }
}
