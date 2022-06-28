import 'package:bank_app/models/user.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SigninSheet extends StatelessWidget {
  SigninSheet({Key? key}) : super(key: key);
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter a username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            child: TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: "Enter a password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthProvider>().signin(
                      user: User(
                        username: _username.text,
                        password: _password.text,
                      ),
                    );
                context.push('/home-page');
              },
              child: Text(
                "Sign in",
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
