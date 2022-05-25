
import 'package:chops/screens/dashboard/home/components/food_category.dart';
import 'package:chops/screens/dashboard/home/components/text_field_widget.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TextFieldWidget(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: Text("Delicious food for you",
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    indicatorColor: primaryColor,
                    tabs: catgoryNames
                        .map((category) => Tab(
                              text: category,
                            ))
                        .toList())
              ]),
              Expanded(
                  child: TabBarView(
                children: catgoryNames
                    .map((category) => FoodCategory(categoryName: category))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
