import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:advance_calculator/calculator_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String expression = "";
  String result = "0";

  final buttonLabels = [
    ['%', '√', 'π', 'AC'],
    ['x^', 'sin', 'cos', 'tan'],
    ['e^x', '(', ')', '/'],
    ['7', '8', '9', '*'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['0' ,'.', '='],
  ];

  Color getButtonColor(String label) {
    switch (label) {
      case 'AC':
        return Colors.orangeAccent;
      case '=':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  double getButtonWidth(String label) {
    const Map<String, double> widths = {
      "0": 110,
      "=": 110,
    };
    return widths[label] ?? 70;
  }

  void onButtonPressed(String label) {
    setState(() {
      if (label == 'AC') {
        expression = "";
        result = "0";
      } else if (label == '=') {
        try {
          String finalExpression = expression
              .replaceAll('x^', '^')
              .replaceAll('√', 'sqrt')
              .replaceAll('π', '3.141592653589793')
              .replaceAll('e^x', 'exp')
              .replaceAll('%', '/100')
              .replaceAllMapped(RegExp(r'sin\((.*?)\)'), (match) => 'sin(${match.group(1)}*3.141592653589793/180)')
              .replaceAllMapped(RegExp(r'cos\((.*?)\)'), (match) => 'cos(${match.group(1)}*3.141592653589793/180)')
              .replaceAllMapped(RegExp(r'tan\((.*?)\)'), (match) => 'tan(${match.group(1)}*3.141592653589793/180)')
              .replaceAllMapped(RegExp(r'sin\^-1\((.*?)\)'), (match) => 'asin(${match.group(1)})')
              .replaceAllMapped(RegExp(r'cos\^-1\((.*?)\)'), (match) => 'acos(${match.group(1)})')
              .replaceAllMapped(RegExp(r'tan\^-1\((.*?)\)'), (match) => 'atan(${match.group(1)})');

          Parser p = Parser();
          Expression exp = p.parse(finalExpression);
          ContextModel cm = ContextModel();
          result = exp.evaluate(EvaluationType.REAL, cm).toString();
        } catch (e) {
          result = "Error";
        }
      } else {
        expression += label;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
              padding: const EdgeInsets.all(20),
              color: Colors.grey,
              width: 350,
              height: 140,
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expression,
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: buttonLabels.map((row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: row.map((label) {
                      return GestureDetector(
                        onTap: () => onButtonPressed(label),
                        child: CalculatorButton(
                          width: getButtonWidth(label),
                          label: label,
                          color: getButtonColor(label),
                        ),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
