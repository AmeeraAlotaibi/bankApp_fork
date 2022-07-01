import 'package:bank_app/models/user.dart';
import 'package:bank_app/models/transaction.dart';
import 'package:bank_app/services/client.dart';
import 'package:bank_app/services/transactions_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TransactionsProvider extends ChangeNotifier {
  late User user;
  late Transaction transaction;

  // deposit
  Future<Response> deposit(int amount, int id) async {
    Response res = await Client.dio.put("/deposit", data: {"amount": amount});
    user.balance = user.balance! + amount;
    user = user.copyWith(balance: user.balance! + amount);
    print("DEPOSITED: ${user.balance}");
    notifyListeners();
    return res;
  }

  // withdraw
  Future<Response> withdraw(int amount, int id) async {
    Response res = await Client.dio.put("/withdraw", data: {"amount": amount});
    user.balance = user.balance! - amount;
    user = user.copyWith(balance: user.balance! - amount);
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

  // TRANSACTIONS LIST
  late List<Transaction> transactions = [];
  Future<List<Transaction>> getTransactions() async {
    transactions = await TransactionsService().getTransactions();
    notifyListeners();
    return transactions;
  }
}
