import 'package:bank_app/Pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  "assets/images/ally-bank-logo.png",
                  width: 200,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // *************** SIGN IN *******************
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                    ),
                    onPressed: () {
                      context.push("/signin");
                    },
                    child: Text("Sign in"),
                  ),

                  SizedBox(width: 40),

                  // *************** SIGN UP *******************
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: () {
                        context.push("/signup");
                      },
                      child: Text("Sign up")),
                ],
              ),

              // *************** TESTING PAGE FOR THEMES *******************
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.push("/test-page");
                  },
                  child: Text("TEST")),
            ]),
      ),
    );
  }
}
