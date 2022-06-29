import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddAuthForm extends StatefulWidget {
  @override
  AddAuthFormState createState() {
    return AddAuthFormState();
  }
}

class AddAuthFormState extends State<AddAuthForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Type Username',
            ),
            maxLines: null,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Type Password',
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Sign up"),
            ),
          )
        ],
      ),
    );
  }
}
