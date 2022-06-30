import 'dart:io';
import 'package:bank_app/services/auth_services.dart';
import 'package:bank_app/services/client.dart';
import 'package:flutter/material.dart';
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
    setToken(token);
    print(token);
    notifyListeners();
  }

  void signin({required User user}) async {
    token = await AuthService().signin(user: user);
    setToken(token);
    notifyListeners();
  }

  bool get isAuth {
    // print("hiiiii");
    getToken();
    // print("Inside isAuth token = $token");
    if (token.isNotEmpty && !Jwt.isExpired(token)) {
      Jwt.isExpired(token);
      user = User.fromJson(Jwt.parseJwt(token));
      Client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      return true;
    } else {
      logout();
      return false;
    }
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    print("logged out");
    notifyListeners();
  }
}
