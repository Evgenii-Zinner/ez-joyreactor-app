import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class JoyreactorApi {
  late Dio dio;

  JoyreactorApi() {
    _initializeDio();
  }

  _initializeDio() async {
    dio = Dio();

    // Get the application support directory
    Directory appSupportDir = await getApplicationSupportDirectory();

    // Create a subdirectory called "cookie" within the support directory
    Directory cookieDir = Directory('${appSupportDir.path}/cookie');

    if (!await cookieDir.exists()) {
      await cookieDir.create(recursive: true);
    }

    // Create a cookie jar to save cookies between sessions
    CookieJar cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(cookieDir.path),
    );

    // Setting up cookie manager to our dio
    dio.interceptors.add(CookieManager(cookieJar));

    dio.options.headers['Content-Type'] = 'application/json';

    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     debugPrint('Request sent: ${options.method} ${options.uri}');
    //     debugPrint('Headers: ${options.headers}');
    //     if (options.data != null) {
    //       debugPrint('Request data: ${options.data}');
    //     }
    //     return handler.next(options);
    //   },
    // ));


    dio.options.method = 'POST';
    dio.options.baseUrl = 'https://api.joyreactor.cc';
    dio.options.connectTimeout = const Duration(seconds: 5); // 5 seconds
    dio.options.receiveTimeout = const Duration(seconds: 3); // 3 seconds
    dio.options.responseType = ResponseType.json;
  }

  Future<Response> sendRequest(String data) async {
    Response response = await dio.request(
      'https://api.joyreactor.cc/graphql',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    return response;
  }
}
