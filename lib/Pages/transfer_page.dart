import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TransferPage extends StatelessWidget {
  TransferPage({Key? key}) : super(key: key);

  final _toUsername = TextEditingController();
  final _amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            textField(
                controller: _toUsername,
                text: "Enter a username",
                icon: Icon(Icons.person),
                hiddenText: false),
            textField(
                controller: _amount,
                text: "enter amount",
                icon: Icon(Icons.money),
                hiddenText: false),
            ElevatedButton(
                onPressed: () async {
                  int amountDouble = int.parse(_amount.text);
                  await context
                      .read<AuthProvider>()
                      .transfer(amountDouble, _toUsername.text);
                  context.pop();
                },
                child: Text("transfer"))
          ],
        ),
      ),
    );
  }
}
