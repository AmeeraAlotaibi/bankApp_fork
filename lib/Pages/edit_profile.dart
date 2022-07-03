import 'dart:io';

import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _image;
  final _picker = ImagePicker();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Edit Profile"),
          elevation: 0,
        ),
        body: Stack(
          children: [
            // ************* background image ******************
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
// ********************** FORM
            Center(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: Axis.vertical,
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
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFDDDDDD),
                      ),
                      child: _image != null
                          ? CircleAvatar(
                              backgroundImage: new FileImage(_image),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFDDDDDD)),
                              width: 200,
                              height: 200,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  textField(
                      controller: _username,
                      text: "Enter new username",
                      icon: Icon(Icons.person),
                      hiddenText: false),
                  SizedBox(
                    height: 10,
                  ),
                  textField(
                      controller: _password,
                      text: "Enter new password",
                      icon: Icon(Icons.key),
                      hiddenText: true),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      context.read<AuthProvider>().updateProfile(
                          username: _username.text,
                          password: _password.text,
                          image: _image!);
                      context.pop();
                    },
                    text: "Update Profile",
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
