import 'package:chops/screens/dashboard/home_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/menu.png')),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/shopping_cart.png'))
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: 1,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home,),label: "", backgroundColor: bgColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: "" ,
                backgroundColor: bgColor, activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "", backgroundColor: bgColor, activeIcon: Icon(Icons.person)),
            BottomNavigationBarItem(
            icon: Icon(Icons.timelapse), label: "",
                backgroundColor: bgColor)
      ]),
    );
  }
}
