import 'package:bank_app/services/client.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthService {
  // sign up
  Future<String> signup({required User user}) async {
    late String token;
    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "passsword": user.password,
        "image": await MultipartFile.fromFile(
          user.image ?? "",
        ),
      });
      Response res = await Client.dio.post("/signup", data: data);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  // sign in
  Future<String> signin({required User user}) async {
    late String token;
    print("THIS IS ${user.username} and password ${user.password}");
    try {
      Response res = await Client.dio.post("/signin",
          data: {"username": user.username, "password": user.password});
      token = res.data["token"];
      print("Sign in $token");
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
