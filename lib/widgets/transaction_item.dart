import 'package:bank_app/models/transaction.dart';
import 'package:bank_app/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, tran, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ListView.builder(
            itemCount: tran.transactions.length,
            itemBuilder: (context, index) => Container(
                  width: 350,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    )),
                  ),
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFfafafa),
                    // color: Colors.pink[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ********** ICON TYPE
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(12, 0, 0, 0),
                          ),
                          child: Icon(
                            tran.transactions[index].type == "deposit"
                                ? Icons.attach_money_rounded
                                : tran.transactions[index].type == "withdraw"
                                    ? Icons.remove_circle_outline_rounded
                                    : Icons.autorenew_rounded,
                            size: 35,
                            color: tran.transactions[index].type == "deposit"
                                ? Colors.green
                                : tran.transactions[index].type == "withdraw"
                                    ? Colors.red
                                    : Colors.blue,
                          ),
                        ),
                        // ************* DATE AND TRANSACTION TYPE
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${tran.transactions[index].type}".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 22.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "01 JULY 2022",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),

                        Column(
                          children: [
                            Text(
                              "\$${tran.transactions[index].amount}",
                              style: TextStyle(
                                color:
                                    tran.transactions[index].type == "deposit"
                                        ? Colors.green
                                        : tran.transactions[index].type ==
                                                "withdraw"
                                            ? Colors.red
                                            : Colors.blue,
                                fontSize: 22.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Amount",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12.5,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )), // add paranthesis for
      ),
    );
  }
}
