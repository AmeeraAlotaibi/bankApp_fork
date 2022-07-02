import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
      ),
      body: Consumer<AuthProvider>(
          builder: (context, auth, child) => Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFF7b4cf5),
                            Color(0xFFb34cf5),
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
                          // gradient: LinearGradient(
                          //   begin: Alignment.topRight,
                          //   end: Alignment.bottomLeft,
                          //   colors: [
                          //     Color(0xFF7b4cf5),
                          //     Color(0xFFb34cf5),
                          //   ],
                          // ),
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
