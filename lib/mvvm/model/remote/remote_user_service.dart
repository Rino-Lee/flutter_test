import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_jjigmuck/mvvm/model/remote/user.dart';

class DioClient with DioMixin implements Dio {
  DioClient() {
    options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      headers: {'Content-Type': 'application/json'},
    );
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    httpClientAdapter = HttpClientAdapter();
  }

  Future<UserDTO> getUser({required String userName}) {
    return get('users/$userName').then((response) {
      return UserDTO.fromJson(response.data);
    });
  }

  Future<Response> login({
    required String userName,
    required String password,
  }) {
    return post(
      'auth/login',
      data: json.encode({'username': userName, 'password': password}),
    );
  }
}
