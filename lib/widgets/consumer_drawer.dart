import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerConsumer extends StatelessWidget {
  const DrawerConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, auth, child) => auth.isAuth
            ? Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF7b4cf5),
                            Color(0xFFb34cf5),
                          ],
                        ),
                      ),
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        accountName: Text(
                          auth.user.username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                        accountEmail: Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        currentAccountPictureSize: Size.fromRadius(50),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(auth.user.image!),
                        ),
                      ),
                    ),
                  ),
                  // ** List of links to pages ******
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              "My Profile",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17),
                            ),
                            leading: Icon(Icons.person),
                            onTap: () {
                              context.push("/profile-page");
                            },
                          ),
                          ListTile(
                            title: Text(
                              "Transactions",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17),
                            ),
                            leading: Icon(Icons.monetization_on),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                              "Reminders",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17),
                            ),
                            leading: Icon(Icons.notifications_active_rounded),
                            onTap: () {},
                          ),

                          SizedBox(
                            height: 100,
                          ),

                          // logging out
                          ListTile(
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 17),
                            ),
                            trailing: Icon(Icons.logout),
                            onTap: () {
                              auth.logout();
                              context.go("/welcome-page");
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("Sign in"),
                      leading: Icon(Icons.login),
                      onTap: () {
                        context.go('/welcome-page');
                      },
                    ),
                    ListTile(
                      title: Text("Sign up"),
                      leading: Icon(Icons.how_to_reg),
                      onTap: () {
                        context.go('/signup');
                      },
                    )
                  ],
                ),
              ));
  }
}
