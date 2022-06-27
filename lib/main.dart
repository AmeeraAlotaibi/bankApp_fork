import 'dart:js';

import 'package:bank_app/Pages/welcome_page.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/signup_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => AuthProvider()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
    );
  }
}
