import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var _image;
  final _picker = ImagePicker();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up ",
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _image = File(image!.path);
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 200, 25, 5)),
                    child: _image != null
                        ? CircleAvatar(
                            backgroundImage: new FileImage(_image),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 14, 104, 177)),
                            width: 200,
                            height: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  //child: Text("Image"),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Enter a username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                controller: _username,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: "Enter a password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                controller: _password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        context
                      },
                      child: Text("Sign up"),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))))),
            ),
          ],
        ),
      ),
    )));
  }
}
