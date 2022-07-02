import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/providers/transactions_provider.dart';
import 'package:bank_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AllTab extends StatelessWidget {
  const AllTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: FutureBuilder(
        future: Provider.of<TransactionsProvider>(context, listen: false)
            .getTransactions(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else
            return TransactionCard();
        },
      ));
}
