import 'package:bank_app/models/user.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
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
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
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
// *********** Sign in ***************
            SafeArea(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // **************** HELLO MESSAGE *****************
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // ******************* BUTTONS *********************
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            textField(
                              controller: _username,
                              text: "Enter your username",
                              icon: const Icon(Icons.person),
                              hiddenText: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textField(
                              controller: _password,
                              text: "Enter your password",
                              icon: Icon(Icons.password_rounded),
                              hiddenText: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              onPressed: () async {
                                await context.read<AuthProvider>().signin(
                                      user: User(
                                        username: _username.text,
                                        password: _password.text,
                                      ),
                                    );
                                context.push("/home-page");
                              },
                              text: "Sign in",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                  ),
                                  child: const Text("Create Account"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ));
  }
}
