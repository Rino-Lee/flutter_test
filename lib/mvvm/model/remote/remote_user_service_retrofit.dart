import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/http.dart';

part 'remote_user_service_retrofit.g.dart';

@JsonSerializable()
class GeneratedUserDTO {
  final String? login;
  final int? id;
  final String? node_id;
  final String? avatar_url;
  final String? gravatar_id;
  final String? url;
  final String? html_url;
  final String? followers_url;
  final String? following_url;
  final String? gists_url;
  final String? starred_url;
  final String? subscriptions_url;
  final String? organizations_url;
  final String? repos_url;
  final String? events_url;
  final String? received_events_url;
  final String? type;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final bool? hireable;
  final String? bio;
  final int? public_repos;
  final int? public_gists;
  final int? followers;
  final int? following;

  factory GeneratedUserDTO.fromJson(Map<String, dynamic> json) =>
      _$GeneratedUserDTOFromJson(json);

  GeneratedUserDTO(
    this.login,
    this.id,
    this.node_id,
    this.avatar_url,
    this.gravatar_id,
    this.url,
    this.html_url,
    this.followers_url,
    this.following_url,
    this.gists_url,
    this.starred_url,
    this.subscriptions_url,
    this.organizations_url,
    this.repos_url,
    this.events_url,
    this.received_events_url,
    this.type,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.public_repos,
    this.public_gists,
    this.followers,
    this.following,
  );
}

@JsonSerializable()
class LoginRequestBody {
  final String username;
  final String password;

  LoginRequestBody(this.username, this.password);

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}

@RestApi(baseUrl: "https://api.github.com/")
abstract class RemoteUserServiceRetrofit {
  factory RemoteUserServiceRetrofit(Dio dio, {String baseUrl}) =
      _RemoteUserServiceRetrofit;

  @GET("users/{userName}")
  Future<GeneratedUserDTO> getUserList(@Path("userName") String userName);

  @POST('auth/login')
  Future<void> login(@Body() LoginRequestBody body);
}
