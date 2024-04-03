import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';

abstract interface class LocalUserService {
  insertUser(String userName);

  deleteUser(UserModel data);

  clean();

  Future<List<UserModel>> getFrequencyUserList();
}
