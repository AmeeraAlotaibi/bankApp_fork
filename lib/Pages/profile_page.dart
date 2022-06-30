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
          )),
      body: Consumer<AuthProvider>(
          builder: (context, auth, child) => auth.isAuth
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 75,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 5, 
                              color: Color(0xFFdddddd),
                              ),
                            image: DecorationImage(
                              image: NetworkImage(auth.user.image!), 
                              fit: BoxFit.cover)
                            ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Text(auth.user.username, 
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                        ),),
                      
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          ),

                        child: Column(
                          children: [
                            Text("Account Balance:", 
                              style: TextStyle(
                                fontSize: 25,
                                )),
                            Text(
                              auth.user.balance.toString(), 
                              style: TextStyle(
                                fontSize: 40, 
                                fontWeight: FontWeight.bold
                              ),
                              )
                          ]
                          ),
                      )
                    ],
                  ),
                )
              : Text("Logged OUT")),
    );
  }
}
