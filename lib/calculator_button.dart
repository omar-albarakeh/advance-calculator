import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final Color color;

  const CalculatorButton({
    super.key,
    this.width = 60,
    this.height=60,
    required this.label,
    this.color= Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(label,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}