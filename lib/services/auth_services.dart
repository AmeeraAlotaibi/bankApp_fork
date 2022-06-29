import 'package:bank_app/services/client.dart';
import 'package:dio/dio.dart';
import '../models/user.dart';

class AuthService {
  // sign up
  Future<String> signup({required User user}) async {
    late User retrievedUsername;
    late String token = '';
    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "passsword": user.password,
        "image": await MultipartFile.fromFile(
          user.image?? "",
        ),
      });
      Response res = await Client.dio.post("/signup", data: data);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

// late String token = '';
//     try {
//       Response res = await Client.dio.post("/signup", data: user.toJson());
//       token = res.data["token"];
//       print("Sign up $token");
//     } on DioError catch (error) {
//       print(error);
//     }
//     return token;

  // sign in
  Future<String> signin({required User user}) async {
    late String token = '';
    try {
      Response res = await Client.dio.post("/signin", data: user.toJson());
      token = res.data["token"];
      print("Sign in $token");
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
