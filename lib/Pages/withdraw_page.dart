import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
import 'package:bank_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WithdrawPage extends StatelessWidget {
  WithdrawPage({Key? key}) : super(key: key);
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, auth, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Withdraw",
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
              children: [
                SizedBox(
                  height: 150,
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
                  "\$${auth.user.balance}",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InputAmount(
                  controller: amount,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onPressed: () async {
                    int intAmount = int.parse(amount.text);
                    // int? id =
                    //     Provider.of<AuthProvider>(context, listen: false).user.id;
                    await auth.withdraw(intAmount);
                    context.pop();
                  },
                  text: "Withdraw",
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
