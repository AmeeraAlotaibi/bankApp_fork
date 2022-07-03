import 'package:bank_app/models/transaction.dart';
import 'package:bank_app/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';

class TransactionsService {
  late List<Transaction> transactions;
  Future<List<Transaction>> getTransactions() async {
    try {
      Response res = await Client.dio.get('/transactions');
      transactions =
          (res.data as List).map((e) => Transaction.fromJson(e)).toList();
    } on DioError catch (error) {
      print(error);
    }
    print(transactions);
    return transactions;
  }
}
