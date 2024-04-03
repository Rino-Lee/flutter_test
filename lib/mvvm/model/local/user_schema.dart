// sqflite
// class UserSchema {
//   final String login;
//   final String? time;
//
//   UserSchema({
//     required this.login,
//     required this.time,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'login,': login,
//       'time,': time,
//     };
//   }
// }

// realm
import 'package:realm/realm.dart';
part 'user_schema.realm.dart';

@RealmModel()
class _UserModel {
  @PrimaryKey()
  late String time;
  late String login;
}
