import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final Widget? suffixicon;
  final TextEditingController? controller;

  const Textfield({
    super.key,
    required this.labeltext,
    required this.hinttext,
    this.suffixicon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          suffixIcon: suffixicon,
          border: OutlineInputBorder()),
    );
  }
}
