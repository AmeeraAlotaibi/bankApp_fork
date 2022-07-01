import 'package:bank_app/models/user.dart';
import 'package:bank_app/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class TransactionsProvider extends ChangeNotifier {
  late User user;

  // deposit
  Future<Response> deposit(int amount, int id) async {
    Response res = await Client.dio.put("/deposit", data: {"amount": amount});
    user.balance = user.balance! + amount;
    // user = user.copyWith(balance: user.balance! + amount);
    notifyListeners();
    print(user.balance);
    return res;
  }

  // withdraw
  Future<Response> withdraw(int amount, int id) async {
    Response res = await Client.dio.put("/deposit", data: {"amount": amount});
    user.balance = user.balance! - amount;
    // user = user.copyWith(balance: user.balance! - amount);
    notifyListeners();
    print(user.balance);
    return res;
  }

  // transfer
  Future<Response> transfer(int amount, String username) async {
    Response res = await Client.dio.post("/transfer/${username}",
        data: {"amount": amount, "username": username});
    user.balance = user.balance! - amount;
    notifyListeners();
    print("MY AMOUNT ${user.balance}");
    return res;
  }
}
