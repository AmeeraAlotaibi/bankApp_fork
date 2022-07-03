import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Icon(
                Icons.refresh_rounded,
                size: 30,
              ),
            ),
            onTap: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
          builder: (context, auth, child) => Center(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFFb34cf5),
                            Color(0xFF7b4cf5),
                          ],
                        ),
                      ),
                      child: Column(children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 5,
                                color: Colors.white,
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(auth.user.image!),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "@username",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    auth.user.username.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 0.75,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.mode_edit_rounded,
                                    color: Colors.black87,
                                  ),
                                  onTap: () {
                                    context.push("/edit-profile");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 6,
                            color: Color(0xFF7b4cf5),
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Account Balance:".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                )),
                            Text(
                              "\$${auth.user.balance.toString()}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              )),
    );
  }
}
