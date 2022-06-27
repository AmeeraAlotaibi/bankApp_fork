import 'package:dio/dio.dart';

class Client {
  static const _baseUrl = "https://coded-bank-api.herokuapp.com";
  static final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
}
