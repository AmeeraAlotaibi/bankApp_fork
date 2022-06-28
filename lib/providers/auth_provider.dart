import 'package:bank_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;

  void signup({required User user}) async {
    token = await AuthService().signup(user: user);
    notifyListeners();
  }

  void signin({required User user}) async {
    token = await AuthService().signin(user: user);
    notifyListeners();
  }
}
