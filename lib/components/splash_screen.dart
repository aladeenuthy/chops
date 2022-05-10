import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_splash.png'),
          fit: BoxFit.cover,
        )
        ),
        child: Center(child: CircleAvatar(
          radius: 95,
          backgroundColor: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
                height: 90,
                child: Image.asset("assets/images/foodie_logo.png"),
              ),
              const Text("Food for everyone", style: TextStyle(color: primaryColor, ),)
            ]),
          ),),
        ),
    );
  }
}