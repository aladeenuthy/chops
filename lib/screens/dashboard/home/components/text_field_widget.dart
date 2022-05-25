import 'package:chops/helpers/device_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/product_helper.dart';
import '../../../../models/product.dart';
import '../../../../utils/constants.dart';
import '../../components/food_card.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  OverlayEntry? entry;
  String text = '';
  final textController = TextEditingController();
  final focusNode = FocusNode();
  final key = GlobalKey();
  LayerLink layerLink = LayerLink();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {}
    });
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    entry = OverlayEntry(
        builder: (context) => Positioned(
              width: DeviceHelper.screenWidth,
              height: DeviceHelper.calcScreenHeight - size.height,
              child: CompositedTransformFollower(
                link: layerLink,
                offset: Offset(0, size.height + 10),
                child: Container(
                  margin: const EdgeInsets.only(right: 40),
                  color: bgColor,
                  child: Material(color: bgColor, child: buildSearchBody()),
                ),
              ),
            ));
    overlay!.insert(entry!);
  }

  void hideOverlay() {
    entry!.remove();
    entry = null;
  }

  Widget buildSearchBody() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: bgColor,
        height: 230,
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

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: layerLink,
        child: TextField(
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
            suffixIcon: IconButton(
                onPressed: () {
                  if (entry == null) {
                    return;
                  }
                  focusNode.unfocus();
                  hideOverlay();
                  textController.text = '';
                  text = '';
                },
                icon: const Icon(Icons.close)),
          ),
        ));
  }
}
