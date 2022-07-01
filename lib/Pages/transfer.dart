import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/providers/transactions_provider.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
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
      appBar: AppBar(
        title: Text("Transfer",
            style: TextStyle(
              fontSize: 25,
            )),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Current Balance".toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$${context.watch<AuthProvider>().user.balance}",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              textField(
                  controller: _toUsername,
                  text: "Enter a username",
                  icon: Icon(Icons.person),
                  hiddenText: false),
              SizedBox(
                height: 10,
              ),
              InputAmount(
                controller: _amount,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () async {
                  int amountDouble = int.parse(_amount.text);
                  await context
                      .read<TransactionsProvider>()
                      .transfer(amountDouble, _toUsername.text);
                  context.pop();
                },
                text: "Transfer",
              )
            ],
          ),
        ),
      ),
    );
  }
}
