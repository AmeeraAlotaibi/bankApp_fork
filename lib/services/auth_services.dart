import 'package:dio/dio.dart';
import '../models/user.dart';
import 'client.dart';

class AuthService {
  final _dio = Dio();

  Future<String> signup(User user) async {
    late String token;
    try {
      Response res = await Client.dio.post("/signup", data: user.toJson());
      token = res.data.token;
      print(token);
    } on DioError catch (error) {
      print("error");
    }
    return token;
  }
}
