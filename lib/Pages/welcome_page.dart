import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(margin: EdgeInsets.only(bottom: 20), child: Image.asset("")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Sign up ")),
            SizedBox(width: 100),
            ElevatedButton(onPressed: () {}, child: Text("Sign in "))
          ],
        ),
      ]),
    );
  }
}
