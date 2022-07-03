import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../models/transaction.dart';

class DepositsTab extends StatefulWidget {
  const DepositsTab({Key? key}) : super(key: key);

  @override
  State<DepositsTab> createState() => _DepositsTabState();
}

class _DepositsTabState extends State<DepositsTab> {
  late Future<dynamic> data;
  void initState() {
    data = AuthProvider().getDeposits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data,
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.hasError) {
            return const Center(
              child: Text(
                "A Network error occurred :(",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return Consumer<AuthProvider>(
              builder: (context, auth, child) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: ListView.builder(
                    itemCount: auth.deposits.length,
                    itemBuilder: (context, index) => Container(
                          width: 350,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: const BoxDecoration(
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
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(12, 0, 0, 0),
                                  ),
                                  child: Icon(
                                    auth.deposits[index].type == "deposit"
                                        ? Icons.attach_money_rounded
                                        : auth.deposits[index].type ==
                                                "withdraw"
                                            ? Icons
                                                .remove_circle_outline_rounded
                                            : Icons.autorenew_rounded,
                                    size: 35,
                                    color:
                                        auth.deposits[index].type == "deposit"
                                            ? Colors.green
                                            : auth.transactions[index].type ==
                                                    "withdraw"
                                                ? Colors.red
                                                : Colors.blue,
                                  ),
                                ),
                                // ************* DATE AND TRANSACTION TYPE
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      auth.deposits[index].type.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 22.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      auth.deposits[index].createdAt,
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 40,
                                ),

                                Column(
                                  children: [
                                    Text(
                                      "\$${auth.deposits[index].amount}",
                                      style: TextStyle(
                                        color: auth.deposits[index].type ==
                                                "deposit"
                                            ? Colors.green
                                            : auth.deposits[index].type ==
                                                    "withdraw"
                                                ? Colors.red
                                                : Colors.blue,
                                        fontSize: 22.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
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
        },
      ),
    );
  }
}