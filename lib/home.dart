import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final buttonlabel=[
    ['AC', '%', '√', 'π'],
    ['x^2', 'x^3' , 'sin' , 'cos' ,'tan'],
    ['e^x' ,'1/x' , 'sin^-1','cos^-1','tan^-1'],
    ['7', '8', '9', '/'],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['C', '0', '=', '+'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child:Column(
    children: [
        Container(
          color: Colors.grey,
          width: 350,
          height: 100,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < 7; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      width: 60,
                      height: 60,
                      color: Colors.white,
                      margin: EdgeInsets.all(15),
                    ),
                ],
              ),
          ],
        ),],
      ),),
    );
  }
}
