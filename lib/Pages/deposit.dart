import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DepositPage extends StatelessWidget {
  DepositPage({Key? key}) : super(key: key);
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Deposit", style: TextStyle(fontSize: 30)),
          centerTitle: true),
      body: Column(
        children: [
          Consumer<AuthProvider>(
              builder: (context, auth, child) =>  Column(
                      children: [
                        Center(
                            child: Text(
                                "Current balancs : ${context.watch<AuthProvider>().user.balance} KD")),
                        Row(
                          children: [
                            Text("eneter your mount"),
                            textField(
                                controller: amount,
                                text: "enter your amount ",
                                icon: Icon(Icons.money),
                                hiddenText: false)
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              int amountDouble = int.parse(amount.text);
                             await auth.deposit(amountDouble, auth.user.id!);
                              context.pop();
                            },
                            child: Text("Deposit"))
                      ],
                    )
                 ),
        ],
      ),
    );
  }
}
