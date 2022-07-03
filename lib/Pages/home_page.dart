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
          title: const Text("Home"),
          elevation: 0,
        ),
        drawer: const Drawer(
          child: DrawerConsumer(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SafeArea(
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) => auth.isAuth
                  ? Flex(
                      direction: Axis.vertical,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // ********* TOP ROW *********
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flex(
                                direction: Axis.vertical,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Welcome back,",
                                    style: TextStyle(
                                      fontSize: 15.5,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    auth.user.username,
                                    style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              // const SizedBox(
                              //   width: 16,
                              // ),
                              // ********* AVATAR
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: const Color(0xFFdddddd),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(auth.user.image!),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                        // ******************* CARD ***************************
                        Expanded(
                          flex: 3,
                          child: Container(
                            // margin: const EdgeInsets.only(top: 25),
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            height: 100,
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
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
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text("Account Balance:".toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    "\$${auth.user.balance.toString()}",
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // ************************ BUTTONS ***********************
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SquareButton(
                                  function: () {
                                    context.push("/deposit-page");
                                  },
                                  text: "Deposit",
                                  icon: const Icon(
                                    Icons.attach_money_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 1,
                                child: SquareButton(
                                  function: () {
                                    context.push("/withdraw-page");
                                  },
                                  text: "Withdraw",
                                  icon: const Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 1,
                                child: SquareButton(
                                  function: () {
                                    context.push("/transfer-page");
                                  },
                                  text: "Transfer",
                                  icon: const Icon(
                                    Icons.autorenew_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // ************ Latest Transactions
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
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
                                    child: const Text(
                                      "See all",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // ********************* CUSTOM WIDGET
                              // TransactionCard(),
                            ],
                          ),
                        )
                      ],
                    )
                  : const Center(
                      child: Text(
                        "UNATHORIZED ACCESS",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),
        ));
  }
}
