import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
class Section extends StatelessWidget {
  const Section({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
        Text(
          "Delivery info",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(height: 5,),
        Text("Delivered between monday aug and thursday 20 from 8pm to 9:32pm",
            style: TextStyle(
                fontSize: 17, color: greyColor, fontWeight: FontWeight.bold))
      ]) ,
    );
  }
}