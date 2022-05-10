import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
class Res extends StatelessWidget {
  const Res({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: primaryColor,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
        ),
        AnimatedContainer(
          height: 300,
          width: 300 ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: shadowColor),
          duration: Duration(milliseconds: 200)
          )
      ],
    );
  }
}