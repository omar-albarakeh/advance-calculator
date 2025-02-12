import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final double size;
  final String label;

  const CalculatorButton({super.key, required this.size, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(label),
      ),
    );
  }
}
