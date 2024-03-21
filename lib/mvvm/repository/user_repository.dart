import 'package:flutter_jjigmuck/mvvm/data_source/remote_data_source.dart';

import '../model/remote/user.dart';

class UserRepository {
  final RemoteDataSource _dataSource = RemoteDataSource();

  Future<User> getUserInfo(String userName) {
    return _dataSource.getUserList(userName);
  }
}
