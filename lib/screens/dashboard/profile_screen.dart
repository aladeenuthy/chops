import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("My profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white

              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/person.png", height: 70,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                      Text(
                          "Aladeen uthy",
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          "Aladeenuthy@gmail.com",
                          style:
                              TextStyle(fontSize: 16,color: greyColor),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "No 15 Kassim ladan bosso street",
                          style:
                              TextStyle(fontSize: 16, color: greyColor),)
                    ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            const Text(
              "Payment method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}