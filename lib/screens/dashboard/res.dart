import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class Res extends StatefulWidget {
  const Res({Key? key}) : super(key: key);

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  var isTRue = true;
  Matrix4 _buildanim() {
    return Matrix4.identity()
      ..translate(180.2, 120.3)
      ..scale(0.7);
  }

  Matrix4 _buildsanim() {
    return Matrix4.identity()
      ..translate(200.2, 100.3)
      ..scale(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          color: primaryColor,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Spacer(
                      flex: 2,
                    ),
                    _DrawerEntry(
                      title: "Orders",
                      icon: Icons.shopping_cart_checkout,
                    ),
                    Divider(color: whiteColor, endIndent: 180, thickness: 1),
                    SizedBox(
                      height: 10,
                    ),
                    _DrawerEntry(
                      title: "Privacy Policy",
                      icon: Icons.note,
                    ),
                    Divider(
                      color: whiteColor,
                      endIndent: 180,
                      thickness: 1,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    _DrawerEntry(
                      title: "Sign out",
                      icon: Icons.arrow_forward,
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ]),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          transform: isTRue ? _buildanim() : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: shadowColor,
          ),
        ),
        AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          duration: Duration(milliseconds: 500),
          transform: isTRue ? _buildsanim() : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(isTRue ? 20 : 0),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      setState(() {
                        isTRue = !isTRue;
                      });
                    },
                    icon: Image.asset('assets/images/menu.png')),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/shopping_cart.png'))
                ],
              ),
              resizeToAvoidBottomInset: false,
              body: AbsorbPointer(child: HomeScreen()),
              bottomNavigationBar: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: 1,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: greyColor,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: "",
                        backgroundColor: bgColor),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: "",
                        backgroundColor: bgColor,
                        activeIcon: Icon(Icons.favorite)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: "",
                        backgroundColor: bgColor,
                        activeIcon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.timelapse),
                        label: "",
                        backgroundColor: bgColor)
                  ]),
            ),
          ),
        )
      ],
    );
  }
}

class _DrawerEntry extends StatelessWidget {
  final String title;
  final IconData icon;
  const _DrawerEntry({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: whiteColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
