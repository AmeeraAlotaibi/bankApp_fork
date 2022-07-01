import 'package:bank_app/Pages/signin_page.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/heavy.png"),
                fit: BoxFit.cover,
              ),
            ),
            // alignment: const Alignment(-1, 0),
          ),

// **************** CONTENT ******************************************************
          SafeArea(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // **************** HELLO MESSAGE *****************
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(top: 250),
                        child: Text(
                          "Hello!",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 100,
                    ),
                    // ******************* BUTTONS *********************
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 250,
                            child: Text(
                              "Please login by using your credentials",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0.25),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            onPressed: () {
                              context.push("/signin");
                            },
                            text: "Sign in",
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Not a member?",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.push("/signup");
                                },
                                style: TextButton.styleFrom(
                                  primary: Color(0xFF7b4cf5),
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                ),
                                child: Text("Create Account"),
                              )
                            ],
                          ),

                          // *************** SIGN UP *******************
                          // CustomButton(
                          //   function: () {
                          //     context.push("/signup");
                          //   },
                          //   text: "Sign up",
                          // ),

                          // *************** TESTING PAGE FOR THEMES *******************
                          // SquareButton(
                          //     function: () {},
                          //     text: "Money",
                          //     icon: Icon(
                          //       Icons.access_alarm,
                          //       color: Colors.white,
                          //     ))
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
