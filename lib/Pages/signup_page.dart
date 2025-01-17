import 'dart:io';
import 'package:bank_app/Pages/home_page.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  var _image;
  final _picker = ImagePicker();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(children: [
          // ************* background image ******************
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // *************** SIGN UP
          SafeArea(
              child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up ",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    // ****************** Image Picker **************************
                    GestureDetector(
                      onTap: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
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
                      height: 40,
                    ),
                    textField(
                      controller: _username,
                      text: "Enter your username",
                      icon: Icon(Icons.person),
                      hiddenText: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textField(
                      controller: _password,
                      text: "Enter your password",
                      icon: Icon(Icons.password_rounded),
                      hiddenText: true,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // ************ SIGN UP BUTTON
                    CustomButton(
                        onPressed: () {
                          context.read<AuthProvider>().signup(
                                user: User(
                                  username: _username.text,
                                  password: _password.text,
                                  image: _image.path,
                                ),
                              );

                          context.go('/home-page');
                        },
                        text: "Sign up"),
                  ],
                ),
              ),
            ),
          )),
        ]));
  }
}
