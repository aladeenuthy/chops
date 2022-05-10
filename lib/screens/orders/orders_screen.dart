import 'package:flutter/material.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
    
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/no_orders.png"),
          const SizedBox(height: 10,),
          const Text("You have no orders", style: TextStyle(fontSize: 20),)
        ]),
      ),
    );
  }
}