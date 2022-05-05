import 'package:flutter/material.dart';
import 'package:chops/utils/constants.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorDark,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_welcome.png'),
            alignment: Alignment(0, 2.5),
            fit: BoxFit.contain
          )),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Padding(padding: const EdgeInsets.all(3), child: Image.asset(
                  "assets/images/foodie_logo.png",
                  fit: BoxFit.cover,
                ),),
              radius: 35,
            ),
            const Text("Food for everyone", style: TextStyle(
              fontSize: 45,
              color: Colors.white,
              
            ),),
            const Spacer(),
            ElevatedButton(
              onPressed: (){}, 
              child: const Text("Get Started", style: TextStyle(color: primaryColorDark, fontSize: 18, fontWeight: FontWeight.bold),), 
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
            )
          ]),
        ),
      )
    );
  }
}