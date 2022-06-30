import 'package:bank_app/models/user.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Text(
                "Sign in",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 60,
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
                height: 25,
              ),
              Container(
                  width: 250,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: ()async  {
                       await  context.read<AuthProvider>().signin(
                              user: User(
                                username: _username.text,
                                password: _password.text,
                              ),
                            );

                        context.go('/home-page');
                      },
                      child: Text(
                        "Sign in",
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))))),
            ],
          ),
        )),
      ),
    );
  }
}
