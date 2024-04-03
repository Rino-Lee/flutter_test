// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schema.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserModel extends _UserModel
    with RealmEntity, RealmObjectBase, RealmObject {
  UserModel(
    String time,
    String login,
  ) {
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'login', login);
  }

  UserModel._();

  @override
  String get time => RealmObjectBase.get<String>(this, 'time') as String;
  @override
  set time(String value) => RealmObjectBase.set(this, 'time', value);

  @override
  String get login => RealmObjectBase.get<String>(this, 'login') as String;
  @override
  set login(String value) => RealmObjectBase.set(this, 'login', value);

  @override
  Stream<RealmObjectChanges<UserModel>> get changes =>
      RealmObjectBase.getChanges<UserModel>(this);

  @override
  UserModel freeze() => RealmObjectBase.freezeObject<UserModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'time': time.toEJson(),
      'login': login.toEJson(),
    };
  }

  static EJsonValue _toEJson(UserModel value) => value.toEJson();
  static UserModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'time': EJsonValue time,
        'login': EJsonValue login,
      } =>
        UserModel(
          fromEJson(time),
          fromEJson(login),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(UserModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, UserModel, 'UserModel', [
      SchemaProperty('time', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('login', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
