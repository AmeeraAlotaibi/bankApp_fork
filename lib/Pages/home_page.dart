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
          child: Consumer<AuthProvider>(
              builder: (context, auth, child) => Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          Text("Account Balance:",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          Text(
                            auth.user.balance.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 44),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.push("/deposit-page");
                                },
                                child: Text("Deposit")),
                            SizedBox(width: 20),
                            ElevatedButton(
                                onPressed: () {
                                  context.push('/withdraw-page');
                                },
                                child: Text("Withdraw")),
                            SizedBox(width: 20),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Transfer")),
                          ],
                        ),
                      )
                    ],
                  )),
        ));
  }
}
