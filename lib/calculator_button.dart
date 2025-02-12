import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final double size;
  final String label;

  const CalculatorButton({super.key, this.size = 65, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(label,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}