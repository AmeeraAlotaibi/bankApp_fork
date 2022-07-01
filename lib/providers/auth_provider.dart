import 'dart:io';

import 'package:bank_app/services/auth_services.dart';
import 'package:bank_app/services/client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  late String token = "";
  late User user;
  bool loading = false;

  void signup({required User user}) async {
    loading = true;
    token = await AuthService().signup(user: user);
    setToken(token);
    print("SIGN UP: $token");
    notifyListeners();
  }

  Future<void> signin({required User user}) async {
    token = await AuthService().signin(user: user);
    setToken(token);
    print("SIGN IN: $token");
    notifyListeners();
  }

  bool get isAuth {
    // print("This is before $token");
    getToken();
    // print("This is after getToken isAuth $token");
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
    // user = User.fromJson(Jwt.parseJwt(token));
    // Client.dio.options.headers = {
    //   HttpHeaders.authorizationHeader: 'Bearer $token',
    // };
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    // notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    token = "";
    print("logged out");
    notifyListeners();
  }
}
