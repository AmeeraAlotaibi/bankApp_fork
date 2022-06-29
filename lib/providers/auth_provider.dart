import 'package:bank_app/services/auth_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;
  bool loading = false;

  void signup({required User user}) async {
    loading = true;
    token = await AuthService().signup(user: user);

    print(token);
    notifyListeners();
  }

  void signin({required User user}) async {
    token = await AuthService().signin(user: user);

    notifyListeners();
  }

  bool get isAuth {
    print("hiiiii");
    getToken();
    if (token.isNotEmpty && !Jwt.isExpired(token)) {
      Jwt.isExpired(token);
      user = User.fromJson(Jwt.parseJwt(token));
      return true;
    } else {
      logout();
      return false;
    }
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    notifyListeners();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("tokin") ?? "";
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    print("logged out");
    // notifyListeners();
  }
}
