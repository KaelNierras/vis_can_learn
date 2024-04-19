import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.controller,
    required this.name,
    required this.fill,
    this.fillColor,
  });

  final TextEditingController controller;
  final String name;
  final bool fill;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: fill, // Add this
        fillColor: fillColor, // Add this
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        labelText: name,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
    );
  }
}