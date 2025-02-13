import 'package:advance_calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final buttonlabels = [
    ['%', '√', 'π' ,'AC'],
    ['x^','sin', 'cos', 'tan'],
    ['e^x', 'sin^-1', 'cos^-1', '/'],
    ['7', '8', '9', ],
    ['4', '5', '6', '*'],
    ['1', '2', '3', '-'],
    ['0', '=', '+'],
  ];

  Color getButtonColor(String label) {
    switch (label) {
      case 'AC':
        return Colors.orange;
      case '=':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  double getButtonWidth(String label){
    switch(label){
      case "0":
        return 140;
      default:
        return 70;
    }
  }
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
          child: Column(
            children: [
            Container(
            color: Colors.grey,
            width: 350,
            height: 100,
            margin:EdgeInsets.all(20),
          ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:buttonlabels.map((row){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:row.map((label){
                     return CalculatorButton(
                       width: getButtonWidth(label),
                         label: label,
                     color: getButtonColor(label),
                     )
                     ;
                    }).toList(),
                  );
                }).toList(),
                )
              )
    ])
    ));
  }
}
