import 'package:chops/helpers/device_helper.dart';
import 'package:chops/screens/dashboard/favorites_screen.dart';
import 'package:chops/screens/dashboard/history_screen.dart';
import 'package:chops/screens/dashboard/home_screen.dart';
import 'package:chops/screens/dashboard/profile_screen.dart';
import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _currentIndex = 0;
  var _drawerOpen = false;
  Matrix4 _shadowTransform() {
    return Matrix4.identity()
      ..translate(180.2, 120.3)
      ..scale(0.7);
  }

  Matrix4 _mainScreenTransform() {
    return Matrix4.identity()
      ..translate(200.2, 100.3)
      ..scale(0.7);
  }

  List<String> screenNames = const [
    'home',
    "My Favorities",
    "My Profile",
    "History"
  ];
  List<Widget> screens = [
    Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == FoodDetailsScreen.routeName) {
          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => FoodDetailsScreen());
        }
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomeScreen());
      },
    ),
    const FavoritiesScreen(),
    const ProfileScreen(),
    const HistoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _Drawer(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: DeviceHelper.screenHeight,
          width: DeviceHelper.screenWidth,
          transform: _drawerOpen ? _shadowTransform() : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: shadowColor,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: _drawerOpen ? _mainScreenTransform() : Matrix4.identity(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_drawerOpen ? 20 : 0),
            child: Scaffold(
              appBar: _currentIndex == 0
                  ? AppBar(
                      leading: IconButton(
                          onPressed: () {
                            setState(() {
                              _drawerOpen = !_drawerOpen;
                            });
                          },
                          icon: Image.asset('assets/images/menu.png')),
                      actions: [
                        IconButton(
                            onPressed: () {
                            
                            },
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Colors.black.withOpacity(0.7)))
                      ],
                    )
                  : AppBar(
                      title: Text(screenNames[_currentIndex],
                          style: const TextStyle(color: Colors.black)),
                      centerTitle: true,
                    ),
              resizeToAvoidBottomInset: false,
              body: AbsorbPointer(
                absorbing: _drawerOpen,
                child: IndexedStack(
                  index: _currentIndex,
                  children: screens,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (value) => setState(() {
                        _currentIndex = value;
                      }),
                  elevation: 0,
                  currentIndex: _currentIndex,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: greyColor,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
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
                        activeIcon: Icon(Icons.favorite)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline),
                        label: "",
                        activeIcon: Icon(Icons.person)),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.timelapse),
                      label: "",
                    )
                  ]),
            ),
          ),
        )
      ],
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
                _DrawerTile(
                  title: "Orders",
                  icon: Icons.shopping_cart_checkout,
                ),
                Divider(color: whiteColor, endIndent: 180, thickness: 1),
                SizedBox(
                  height: 10,
                ),
                _DrawerTile(
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
                _DrawerTile(
                  title: "Sign out",
                  icon: Icons.arrow_forward,
                ),
                Spacer(
                  flex: 3,
                )
              ]),
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  const _DrawerTile({Key? key, required this.title, required this.icon})
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
