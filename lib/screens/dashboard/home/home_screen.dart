import 'package:chops/helpers/device_helper.dart';
import 'package:chops/screens/dashboard/home/components/food_category.dart';

import 'package:chops/utils/constants.dart';
import 'package:chops/utils/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../helpers/product_helper.dart';
import '../../../models/product.dart';
import '../components/food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchBodyOpen = false;
  String text = '';
  final textController = TextEditingController();
  final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          searchBodyOpen = true;
        });
      }
    });
  }

  Matrix4 initial() {
    return Matrix4.identity()..translate(-(DeviceHelper.screenWidth), 60.0);
  }

  Matrix4 bodyOpen() {
    return Matrix4.identity()..translate(0.0, 60.0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          onTap: () {
                            if (searchBodyOpen) {
                              return;
                            }
                            setState(() {
                              searchBodyOpen = true;
                            });
                          },
                          controller: textController,
                          onChanged: (value) {
                            setState(() {
                              text = value;
                            });
                          },
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            fillColor: greyColor.withOpacity(0.15),
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30)),
                            hintText: "Search",
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: searchBodyOpen ? IconButton(
                                onPressed: () {
                                  focusNode.unfocus();
                                  textController.text = '';
                                  text = '';
                                  setState(() {
                                    searchBodyOpen = false;
                                  });
                                },
                                icon: const Icon(Icons.close)
                                ): null,
                          ),
                        ),
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
                      child: searchBodyOpen
                          ? Container()
                          : TabBarView(
                              children: catgoryNames
                                  .map((category) =>
                                      FoodCategory(categoryName: category))
                                  .toList(),
                            ))
                ],
              ),
              AnimatedContainer(
                height: DeviceHelper.availableScreenHeight - 60,
                decoration:  const BoxDecoration(
                  color: bgColor,
                  border: Border.symmetric(horizontal: BorderSide(color: greyColor, ))
                  ),
                duration: const Duration(milliseconds: 200),
                transform: searchBodyOpen ? bodyOpen(): initial(),
                child: SearchBody(text: capitalizeText (text)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  final String text;

  const SearchBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 240,
        child: StreamBuilder<QuerySnapshot<Product>>(
            stream: text.isEmpty ? null : ProductHelper.search(text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.size,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return FoodCard(
                      product: snapshot.data!.docs[index].data(),
                    );
                  },
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
