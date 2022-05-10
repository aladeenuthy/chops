import 'package:flutter/material.dart';
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/images/no_history.png'),
          const Text("No history yet", style: TextStyle(fontSize: 20),)
        ],),
      ),
    );
  }
}