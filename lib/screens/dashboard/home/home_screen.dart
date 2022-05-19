import 'package:chops/screens/dashboard/home/components/food_category.dart';
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
                  const SizedBox(
                    width: 200,
                    child:Text("Delicious food for you",
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
                  TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      indicatorColor: primaryColor,
                      tabs: catgoryNames.map((category) => Tab(text: category ,)).toList()
                      )
                ]),
                Expanded(
                    child: TabBarView(
                  children: catgoryNames.map((category) => FoodCategory(categoryName: category)).toList(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
