import 'package:dio/dio.dart';

import '../model/remote/user.dart';

class RemoteDataSource {
  Future<User> getUserList(String userName) async {
    final dio = Dio();
    dio.options.baseUrl = "https://api.github.com/";
    try {
      return dio.get("users/${userName}").then(
          (response) {
        print(response.statusCode);
        return User.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
