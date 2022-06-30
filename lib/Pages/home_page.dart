import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/consumer_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Welcome")),
        drawer: const Drawer(
          child: DrawerConsumer(),
        ),
        body: SafeArea(
          child: Center(child: Text("Hello Meera!")),
        ));
  }
}
