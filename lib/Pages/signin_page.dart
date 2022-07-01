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
                          margin: EdgeInsets.only(top: 50),
                          child: Text(
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
                                if (ConnectionState ==
                                    ConnectionState.waiting) {
                                  Center(child: CircularProgressIndicator());
                                } else
                                  context.push("/home-page");
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3),
                                  ),
                                  child: Text("Create Account"),
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

// SafeArea(
//         child: SingleChildScrollView(
//             child: Center(
//           child: Column(
//             children: [
//               Text(
//                 "Sign in",
//                 style: TextStyle(fontSize: 50),
//               ),
//               SizedBox(
//                 height: 60,
//               ),
//               textField(
//                 controller: _username,
//                 text: "Enter your username",
//                 icon: Icon(Icons.person),
//                 hiddenText: false,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               textField(
//                 controller: _password,
//                 text: "Enter your password",
//                 icon: Icon(Icons.password_rounded),
//                 hiddenText: true,
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               Container(
//                   width: 250,
//                   height: 55,
//                   child: ElevatedButton(
//                       onPressed: ()async  {
//                        await  context.read<AuthProvider>().signin(
//                               user: User(
//                                 username: _username.text,
//                                 password: _password.text,
//                               ),
//                             );

//                         context.go('/home-page');
//                       },
//                       child: Text(
//                         "Sign in",
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15))))),
//             ],
//           ),
//         )),
//       ),