import 'dart:io';

import 'package:bank_app/models/transaction.dart';
import 'package:bank_app/models/user.dart';
import 'package:bank_app/services/auth_services.dart';
import 'package:bank_app/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    user = User.fromJson(Jwt.parseJwt(token));
    Client.dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
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

// ********************* USER PROFILE UPDATE *********************
  bool value = false;
  Future<bool> updateProfile(
      {required String username, required String password, File? image}) async {
    try {
      FormData data = FormData.fromMap({
        "username": username,
        "password": password,
        "image": await MultipartFile.fromFile(image!.path),
      });

      Response res = await Client.dio.put("/update", data: data);
      value = true;
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();
    return value;
  }

// ***************** TRANSACTIONS
  // deposit
  Future<Response> deposit(int amount) async {
    Response res = await Client.dio.put("/deposit", data: {"amount": amount});
    user.balance = user.balance! + amount;
    // user = user.copyWith(balance: user.balance! + amount);
    print("DEPOSITED: ${user.balance}");
    notifyListeners();
    return res;
  }

  // withdraw
  Future<Response> withdraw(int amount) async {
    Response res = await Client.dio.put("/withdraw", data: {"amount": amount});
    user.balance = user.balance! - amount;
    // user = user.copyWith(balance: user.balance! - amount);
    print("WITHDRAWN: ${user.balance}");
    notifyListeners();
    return res;
  }

  // transfer
  Future<Response> transfer(int amount, String username) async {
    Response res = await Client.dio.post("/transfer/${username}",
        data: {"amount": amount, "username": username});
    user.balance = user.balance! - amount;
    print("TRANSFERED ${user.balance}");
    notifyListeners();
    return res;
  }

// ****************** LIST OF ALL TRANSACTIONS **********************************
  List<Transaction> transactions = [];
  Future<List<Transaction>> getTransactions() async {
    try {
      Response res = await Client.dio.get('/transactions');
      print(res.statusCode);
      print(res);
      transactions =
          (res.data as List).map((e) => Transaction.fromJson(e)).toList();
      print(transactions);
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();
    return transactions;
  }

// deposits list
  List<Transaction> deposits = [];
  Future<List<Transaction>> getDeposits() async {
    try {
      Response res = await Client.dio.get("/transactions");
      transactions =
          (res.data as List).map((e) => Transaction.fromJson(e)).toList();
      deposits =
          transactions.where((element) => element.type == 'deposit').toList();
      print(deposits);
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();
    return deposits;
  }

// withdraws list
  List<Transaction> withdraws = [];
  Future<List<Transaction>> getWithdraws() async {
    try {
      Response res = await Client.dio.get("/transactions");
      transactions =
          (res.data as List).map((e) => Transaction.fromJson(e)).toList();
      withdraws =
          transactions.where((element) => element.type == 'withdraw').toList();
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();
    return withdraws;
  }

// transfers list
  List<Transaction> transfers = [];
  Future<List<Transaction>> getTransfers() async {
    try {
      Response res = await Client.dio.get("/transactions");
      transactions =
          (res.data as List).map((e) => Transaction.fromJson(e)).toList();
      transfers =
          transactions.where((element) => element.type == 'transfer').toList();
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();
    return transfers;
  }
}
