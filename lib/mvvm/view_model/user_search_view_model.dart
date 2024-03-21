import 'package:flutter/cupertino.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';
import 'package:flutter_jjigmuck/mvvm/repository/user_repository.dart';

class UserViewModel with ChangeNotifier {
  late final UserRepository _userRepository;

  bool isDataFetching = true;

  User _user = User();

  User get user => _user;

  UserViewModel() {
    _userRepository = UserRepository();
  }

  Future<void> getUser(String userName) async {
    _user = await _userRepository.getUserInfo(userName);
    notifyListeners();
  }
}
