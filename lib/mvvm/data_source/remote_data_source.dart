import 'package:dio/dio.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/remote_user_service.dart';

import '../model/remote/user.dart';

class RemoteDataSource implements RemoteUserService{
  @override
  Future<UserDTO> getUserList(String userName) async {
    final dio = Dio();
    dio.options.baseUrl = "https://api.github.com/";
    try {
      return dio.get("users/${userName}").then(
              (response) {
            print(response.statusCode);
            return UserDTO.fromJson(response.data);
          });
    } catch (e) {
      throw Exception();
    }
  }

}
