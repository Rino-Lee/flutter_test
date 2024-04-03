import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final _version = 1;

  Database? _db;
  static final dbName = 'user_database.db';
  static final table = 'user_table';
  static final columnTime = 'time';
  static final columnLogin = 'login';

  Future get database async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    var documentDirectory = await getDatabasesPath();
    final path = join(documentDirectory, dbName);
    var dataBase = openDatabase(path, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $table(
              $columnTime TEXT PRIMARY KEY,
              $columnLogin TEXT
              )
            ''');
    });
    return dataBase;
  }

  Future<int> insertUserData(Map<String, dynamic> userData) async {
    var database = await initDB();
    return await database.insert(table, userData);
  }

  Future<List<Map<String, dynamic>>> readUserData() async {
    var database = await initDB();
    return await database.query(table);
  }

  Future<int> deleteUserData(String time) async {
    var database = await initDB();
    return await database.delete(table, where: 'time=?', whereArgs: [time]);
  }
}
