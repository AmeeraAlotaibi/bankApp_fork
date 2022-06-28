import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Welcome ")),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Center(child: DrawerHeader(child: Text("welcome NAME "))),
              ListTile(
                title: const Text("Signin"),
                trailing: const Icon(Icons.login),
                onTap: () {
                  GoRouter.of(context).push('/signin');
                },
              ),
              ListTile(
                title: const Text("Signup"),
                trailing: const Icon(Icons.how_to_reg),
                onTap: () {
                  GoRouter.of(context).push('/signup');
                },
              )
            ],
          ),
        ),
      ),
    );

    body:
    SafeArea(
      child: Center(child: Text("Hello Amira!")),
    );
  }
}
