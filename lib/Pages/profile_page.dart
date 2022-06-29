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
        builder: (context, auth, child) {
          return Center(
            child: Column(children: [
              SizedBox(height:100,)
              , Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black), height:  100 
                ,child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  backgroundImage: NetworkImage(auth.user.image),
                                ),
              ),
            ],),
          );
        }
      ),
    );
  }
}
