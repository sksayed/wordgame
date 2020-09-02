import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscure;
  final Function(String) validation;
  final Function(String) onChange;
  TextEditingController controller;

  CustomTextField({
    this.label,
    this.obscure,
    this.validation,
    this.onChange,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      onChanged: onChange,
      obscureText: obscure,
      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        fillColor: Color(0xffEE9090),
        labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
