import 'package:flutter/cupertino.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';
import 'package:flutter_jjigmuck/mvvm/repository/user_repository.dart';

import '../model/remote/remote_user_service_retrofit.dart';
import '../model/remote/user.dart';

class UserViewModel extends ChangeNotifier {
  late final UserRepository _userRepository;

  bool isDataFetching = true;

  GeneratedUserDTO? _retrofitUser;
  GeneratedUserDTO? get retrofitUser => _retrofitUser;

  UserDTO? _user;
  UserDTO? get user => _user;

  UserViewModel() {
    _userRepository = UserRepository();
  }

  Future<void> getUserGenerated(String userName) async {
    _retrofitUser = await _userRepository.getUserInfo(userName);
    notifyListeners();
  }

  Future<void> getUser(String userName) async {
    final _response = await _userRepository.getUser(userName);
    _user = _response;
    notifyListeners();
  }

  deleteUser(UserModel data) async {
    return _userRepository.deleteUser(data);
  }

  deleteAll() async {
    return _userRepository.cleanLocal();
}

  Future<List<UserModel>> getFrequencySearchUserList() async {
    return _userRepository.getFrequencySearchedUserList();
  }
}
