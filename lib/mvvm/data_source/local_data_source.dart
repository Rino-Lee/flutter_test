import 'package:flutter/cupertino.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/realm/local_user_service.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';
import 'package:realm/realm.dart';

class LocalDataSource implements LocalUserService {
  late final Realm _realm;

  LocalDataSource() {
    _realm = Realm(Configuration.local([UserModel.schema]));
  }

  @override
  insertUser(String userName) async {
    final time = new DateTime.now();
    var user = UserModel(time.toIso8601String(), userName);
    return _realm.write(() => _realm.add<UserModel>(user));
  }

  @override
  deleteUser(UserModel data) async {
    return _realm.write(() => _realm.delete(data));
  }

  @override
  Future<List<UserModel>> getFrequencyUserList() async {
    debugPrint("${_realm.all<UserModel>().map((e) => e.toEJson())}");
    return _realm.all<UserModel>().toList();
  }

  @override
  clean() {
    return _realm.write(() => _realm.deleteAll<UserModel>());
  }
}
