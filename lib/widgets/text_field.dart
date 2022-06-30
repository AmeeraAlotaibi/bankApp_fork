import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    Key? key,
    required this.controller,
    required this.text,
    required this.icon,
    required this.hiddenText,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final Icon icon;
  final bool hiddenText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        obscureText: hiddenText,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
