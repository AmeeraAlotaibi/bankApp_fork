import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
          prefixIcon: icon,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black38,
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF7b4cf5),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

// DEPOSIT AND WITHDRAW AND TRANSFER INPUT FIELDS
class InputAmount extends StatelessWidget {
  const InputAmount({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Color(0xFF7b4cf5),
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          label: Text("Enter an Amount"),
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          // hintText: "Enter your amount",
          // hintStyle: TextStyle(
          //     color: Colors.black38,
          //     fontSize: 15,
          //     fontWeight: FontWeight.normal),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Icon(
              Icons.attach_money,
              size: 50,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.black38,
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF7b4cf5),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
