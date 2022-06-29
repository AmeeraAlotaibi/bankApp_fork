import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeDrawerTwo extends StatelessWidget {
  const HomeDrawerTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<AuthProvider>(
            builder: (context, auth, child) => auth.isAuth
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DrawerHeader(
                          child: UserAccountsDrawerHeader(
                            decoration: BoxDecoration(color: Color(0xFFfafafa)),
                            accountName: Text(
                              auth.user.username,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                              ),
                            ),
                            accountEmail: Text(
                              "Welcome Back",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                            ),
                            currentAccountPictureSize: Size.fromRadius(50),
                            currentAccountPicture: CircleAvatar(
                              backgroundColor: Colors.black12,
                              backgroundImage: NetworkImage(auth.user.image),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: ListView(
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
                                leading:
                                    Icon(Icons.notifications_active_rounded),
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
                                  // context.read<AuthProvider>().logout();
                                  // auth.logout();
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : ListView(
                    children: [
                      ListTile(
                        title: Text("Sign in"),
                        trailing: Icon(Icons.login),
                        onTap: () {
                          context.go('/welcome-page');
                        },
                      ),
                      ListTile(
                        title: Text("Sign up"),
                        trailing: Icon(Icons.how_to_reg),
                        onTap: () {
                          context.go('/signup');
                        },
                      )
                    ],
                  )));
  }
}
