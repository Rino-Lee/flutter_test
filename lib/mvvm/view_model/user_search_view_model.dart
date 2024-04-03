import 'package:flutter/cupertino.dart';
import 'package:flutter_jjigmuck/mvvm/model/local/user_schema.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';
import 'package:flutter_jjigmuck/mvvm/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  late final UserRepository _userRepository;

  bool isDataFetching = true;

  UserDTO _user = UserDTO();

  UserDTO get user => _user;

  UserViewModel() {
    _userRepository = UserRepository();
  }

  Future<void> getUser(String userName) async {
    _user = await _userRepository.getUserInfo(userName);
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
