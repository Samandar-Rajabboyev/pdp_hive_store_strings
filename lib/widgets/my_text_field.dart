import 'package:flutter/material.dart';

TextField buildTextField(
    {required String hint, required IconData iconData, required TextEditingController controller}) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w400),
      prefixIconConstraints: const BoxConstraints(maxWidth: 40),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(iconData, color: Colors.white70),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white70),
      ),
    ),
  );
}
