import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
class FoodCard extends StatelessWidget {
  const FoodCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: 160,
      child: Stack(
        alignment: Alignment.center,
        children:[
          Positioned(
            bottom: 0,  
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const[
              Text(
                "Veggie tomato mix",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(height: 10,),
              Text("N1900.0", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold))
            ],),),
          ),
          Positioned(
            top: 0,
          child: Image.asset("assets/images/food_1.png" , height: 160,width: 160, ))
        ] ,
      ),
    );
  }
}