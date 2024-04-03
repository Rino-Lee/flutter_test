import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';

abstract interface class RemoteUserService {

  Future<UserDTO> getUserList(String userName);
}
