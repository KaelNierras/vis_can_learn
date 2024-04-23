import 'package:flutter/material.dart';

class InputTextSecondary extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const InputTextSecondary({
    super.key, 
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set the border color
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Set the border color
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}