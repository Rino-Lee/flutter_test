import 'package:flutter_jjigmuck/mvvm/model/remote/remote_user_service_retrofit.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';

import '../model/remote/remote_user_service.dart';

class RemoteDataSource{

  Future<GeneratedUserDTO> getUserListGenerated(String userName) async {
    final dio = RemoteUserServiceRetrofit(DioClient());
    try {
      return dio.getUserList(userName);
    } catch (e) {
      throw Exception();
    }
  }

  Future<UserDTO> getUserList(String userName) async {
    final dio = DioClient();
    try {
      return dio.getUser(userName: userName);
    } catch (e) {
      throw Exception();
    }
  }
}
