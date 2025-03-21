import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
    super.key, 
    required this.controller,
    required this.hintText,
    required this.obscureText 
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        //border when unselected
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(12),
        ),

        //border when selected
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(12),
        ),

        //hint text
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        fillColor: Theme.of(context).colorScheme.secondary,
        filled: true,
      ),
    );
  }

}