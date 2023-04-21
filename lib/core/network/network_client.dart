import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'network_methods.dart';
const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;


class NetworkClient {
  final String baseUrl;

  late Dio _dio;

  final List<Interceptor>? interceptors;

  NetworkClient(
    this.baseUrl, {
    this.interceptors,
  }) {
    _dio = Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
  }

  Future<dynamic> handleNetworkRequest(
    String uri, {
    Methods requestMethod = Methods.get,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      switch (requestMethod) {
        case Methods.get:
          var response = await _dio.get(
            uri,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          return response.data;
        case Methods.post:
          var response = await _dio.post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          return response.data;
        case Methods.patch:
          var response = await _dio.patch(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          return response.data;
        case Methods.delete:
          var response = await _dio.delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
          return response.data;
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException(e.toString());
    } catch (e) {
      rethrow;
    }
  }
}
