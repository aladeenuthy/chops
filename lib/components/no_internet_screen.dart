import 'package:flutter/material.dart';
class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Center(
          child:Image.asset("assets/images/no_internet.png")
        ),
      ),
    );
  }
}