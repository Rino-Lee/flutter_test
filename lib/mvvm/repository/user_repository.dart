import 'package:dio/dio.dart';
import 'package:flutter_jjigmuck/mvvm/data_source/local_data_source.dart';
import 'package:flutter_jjigmuck/mvvm/data_source/remote_data_source.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';

import '../model/remote/remote_user_service_retrofit.dart';

class UserRepository {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final LocalDataSource _localDataSource = LocalDataSource();

  Future<GeneratedUserDTO> getUserInfo(String userName) {
    _localDataSource.insertUser(userName);
    return _remoteDataSource.getUserListGenerated(userName);
  }

  Future<UserDTO> getUser(String userName) {
    _localDataSource.insertUser(userName);
    return _remoteDataSource.getUserList(userName);
  }

  Future<List<UserModel>> getFrequencySearchedUserList() {
    return _localDataSource.getFrequencyUserList();
  }

  cleanLocal() {
    return _localDataSource.clean();
  }

  Future<int> deleteUser(UserModel time) {
    return _localDataSource.deleteUser(time);
  }
}
