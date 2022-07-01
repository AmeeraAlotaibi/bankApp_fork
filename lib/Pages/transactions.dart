import 'package:bank_app/pages/tabs_pages/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Transactions"),
              centerTitle: true,
              elevation: 0,
              bottom: TabBar(tabs: [
                Tab(
                  text: "All",
                  icon: Icon(
                    Icons.all_inbox,
                  ),
                ),
                Tab(
                  text: "Deposit",
                  icon: Icon(
                    Icons.attach_money_rounded,
                  ),
                ),
                Tab(
                  text: "Withdraw",
                  icon: Icon(
                    Icons.remove_circle_outline_rounded,
                  ),
                ),
                Tab(
                  text: "Transfer",
                  icon: Icon(
                    Icons.autorenew_rounded,
                  ),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                AllTab(),
                Center(
                  child: Text("Tab2!"),
                ),
                Center(
                  child: Text("Tab3!"),
                ),
                Center(
                  child: Text("Tab4!"),
                ),
              ],
            )),
      );
}
