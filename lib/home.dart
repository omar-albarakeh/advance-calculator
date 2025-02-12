import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator" ,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child:Row(
    children: [
         for(int i=0 ;i<4 ;i++)
           Container(
             width: 70,
             height: 70,
             color: Colors.white,
             margin: EdgeInsets.all(5),
           ),
       ],
        ),
      ),
    );
  }
}
