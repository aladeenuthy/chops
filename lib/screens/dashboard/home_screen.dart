import 'package:chops/screens/food_details/food_details_screen.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text("Delicious food for you",
                        style: TextStyle(
                          fontSize: 35,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        fillColor: greyColor.withOpacity(0.15),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(
                          text: "Food",
                        ),
                        Tab(
                          text: "Drinks",
                        ),
                        Tab(
                          text: "Snacks",
                        ),
                        Tab(
                          text: "Sauce",
                        ),
                        Tab(
                          text: "Others",
                        )
                      ])
                ]),
                Expanded(
                    child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.red,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blue,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.green,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.orange,
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.purple,
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
