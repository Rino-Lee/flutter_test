// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_service_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedUserDTO _$GeneratedUserDTOFromJson(Map<String, dynamic> json) =>
    GeneratedUserDTO(
      json['login'] as String?,
      json['id'] as int?,
      json['node_id'] as String?,
      json['avatar_url'] as String?,
      json['gravatar_id'] as String?,
      json['url'] as String?,
      json['html_url'] as String?,
      json['followers_url'] as String?,
      json['following_url'] as String?,
      json['gists_url'] as String?,
      json['starred_url'] as String?,
      json['subscriptions_url'] as String?,
      json['organizations_url'] as String?,
      json['repos_url'] as String?,
      json['events_url'] as String?,
      json['received_events_url'] as String?,
      json['type'] as String?,
      json['name'] as String?,
      json['company'] as String?,
      json['blog'] as String?,
      json['location'] as String?,
      json['email'] as String?,
      json['hireable'] as bool?,
      json['bio'] as String?,
      json['public_repos'] as int?,
      json['public_gists'] as int?,
      json['followers'] as int?,
      json['following'] as int?,
    );

Map<String, dynamic> _$GeneratedUserDTOToJson(GeneratedUserDTO instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'node_id': instance.node_id,
      'avatar_url': instance.avatar_url,
      'gravatar_id': instance.gravatar_id,
      'url': instance.url,
      'html_url': instance.html_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'gists_url': instance.gists_url,
      'starred_url': instance.starred_url,
      'subscriptions_url': instance.subscriptions_url,
      'organizations_url': instance.organizations_url,
      'repos_url': instance.repos_url,
      'events_url': instance.events_url,
      'received_events_url': instance.received_events_url,
      'type': instance.type,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'hireable': instance.hireable,
      'bio': instance.bio,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
    };

LoginRequestBody _$LoginRequestBodyFromJson(Map<String, dynamic> json) =>
    LoginRequestBody(
      json['username'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestBodyToJson(LoginRequestBody instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RemoteUserServiceRetrofit implements RemoteUserServiceRetrofit {
  _RemoteUserServiceRetrofit(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.github.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GeneratedUserDTO> getUserList(String userName) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GeneratedUserDTO>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'users/${userName}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GeneratedUserDTO.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> login(LoginRequestBody body) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          'auth/login',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
