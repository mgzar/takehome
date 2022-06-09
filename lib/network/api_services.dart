import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum RequestType { get, post, put, delete }

class ApiService {
  final String url;
  dynamic data;
  Map<String, dynamic>? params;
  ContentType? contentType;
  var baseUrl = "https://a69648a5-f361-43d0-a18c-5e0c6942687b.mock.pstmn.io/";
  var dio = Dio();

  ApiService(this.url, {this.data, this.params});

  var navigatorKey = GlobalKey<NavigatorState>();

  Dio _dio() {
    dio.interceptors.addAll([
      InterceptorsWrapper(onRequest: (request, handler) async {
        return handler.next(request);
      }, onError: (e, handler) async {
        var dioError = await onError(e);
        return handler.reject(dioError);
      }),
      PrettyDioLogger()
    ]);
    return dio;
  }

  void apiCall({
    required RequestType requestType,
    required Function(Response<dynamic> data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var response = await checkStatus(requestType);
    if (response.statusCode != null) {
      onSuccess(response);
    } else {
      onError(response.statusMessage);
    }
  }

  Future<Response<dynamic>> checkStatus(RequestType requestType) {
    switch (requestType) {
      case RequestType.get:
        return _dio().get(baseUrl + url, queryParameters: params);
      case RequestType.post:
        return _dio().post(
          baseUrl + url,
          queryParameters: params,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          ),
        );
      case RequestType.put:
        return _dio().put(baseUrl + url, queryParameters: params, data: data);
      case RequestType.delete:
        return _dio().post(baseUrl + url, queryParameters: params, data: data);
    }
  }

  Future<dynamic> onError(DioError dioError) async {
    if (kDebugMode) {
      print(dioError.response);
    }
    return dioError;
  }
}
