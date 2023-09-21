import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({super.key, required this.controller, this.hint});
  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint ?? "Type something ...",
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          filled: true,
          hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          fillColor: Colors.white),
      controller: controller,
    );
  }
}
