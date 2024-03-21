import 'package:realm/realm.dart';

part 'user_schema.g.dart';

@RealmModel()
class _UserSchema {
  late String login;
  @PrimaryKey()
  late int? id;
  late String? node_id;
  late String? avatar_url;
  late String? gravatar_id;
  late String? url;
  late String? html_url;
  late String? followers_url;
  late String? following_url;
  late String? gists_url;
  late String? starred_url;
  late String? subscriptions_url;
  late String? organizations_url;
  late String? repos_url;
  late String? events_url;
  late String? received_events_url;
  late String? type;
  late String? name;
  late String? company;
  late String? blog;
  late String? location;
  late String? email;
  late bool? hireable;
  late String? bio;
  late int? public_repos;
  late int? public_gists;
  late int? followers;
  late int? following;
}
