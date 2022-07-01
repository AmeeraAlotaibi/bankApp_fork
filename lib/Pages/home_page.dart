import 'package:bank_app/providers/auth_provider.dart';
import 'package:bank_app/widgets/consumer_drawer.dart';
import 'package:bank_app/widgets/custom_buttons.dart';
import 'package:bank_app/widgets/transaction_item.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
          elevation: 0,
        ),
        drawer: const Drawer(
          child: DrawerConsumer(),
        ),
        body: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) => auth.isAuth
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // ********* TOP ROW *********
                      Container(
                        padding: EdgeInsets.only(left: 60, right: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome back,",
                                  style: TextStyle(
                                    fontSize: 15.5,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  auth.user.username,
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            // ********* AVATAR
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFFdddddd),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(auth.user.image!),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                      // ******************* CARD ***************************
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xFF7b4cf5),
                              Color(0xFFb34cf5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Account Balance:".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                              Text(
                                "\$${auth.user.balance.toString()}",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ************************ BUTTONS ***********************
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SquareButton(
                                function: () {
                                  context.push("/deposit-page");
                                },
                                text: "Deposit",
                                icon: Icon(
                                  Icons.attach_money_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              flex: 1,
                              child: SquareButton(
                                function: () {
                                  context.push("/withdraw-page");
                                },
                                text: "Withdraw",
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              flex: 1,
                              child: SquareButton(
                                function: () {
                                  context.push("/transfer-page");
                                },
                                text: "Transfer",
                                icon: Icon(
                                  Icons.autorenew_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // ************ Latest Transactions
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Transactions",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // *************** HERE SEE ALL
                                    context.push('/transactions');
                                  },
                                  child: Text(
                                    "See all",
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            // ********************* CUSTOM WIDGET
                            // TransactionCard(),
                          ],
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                      "UNATHORIZED ACCESS",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ));
  }
}
