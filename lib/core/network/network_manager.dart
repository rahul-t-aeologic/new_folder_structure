import 'dart:io';

import 'package:dio/dio.dart';

import '../di.dart';
import 'api_result.dart';
import 'i_error_model.dart';
import 'network_client.dart';
import 'network_error.dart';
import 'network_methods.dart';

class NetworkManager {
  late NetworkClient _dioClient;
  final IErrorModel errorModel;

  NetworkManager(
    String baseUrl,
    this.errorModel,
  ) {
    _dioClient = NetworkClient(baseUrl);
  }

  static void registerDependencies() {
    DI.instance.registerSingleton<NetworkManager>(
      (di) => NetworkManager(
        di.get<String>(instanceName: 'base_url'),
        di.get<IErrorModel>(),
      ),
    );
  }

  Future<ApiResult<Map<String, dynamic>>> handleNetworkRequest(
    String path, {
    Methods requestMethod = Methods.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? addHeaders,
    data,
  }) async {
    try {
      final response = await _dioClient.handleNetworkRequest(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: addHeaders),
      ) as Map<String, dynamic>;

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(_getDioException(e));
    }
  }

  NetworkError _getDioException(dynamic error) {
    String networkExceptions;
    int statusCode = 0;
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = 'Request Cancelled';
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = 'Connection request timeout';
              break;
            case DioErrorType.other:
              networkExceptions = 'No internet connection';
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = 'Send timeout in connection with API server';
              break;
            case DioErrorType.response:
              final response = error.response;
              statusCode = response?.statusCode ?? 0;
              try {
                networkExceptions =
                    errorModel.getNetworkError(response!.data).errorMessage;
              } catch (e) {
                networkExceptions = "Received invalid status code: $statusCode";
              }
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = 'Send timeout in connection with API server';
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = 'No internet connection';
        } else {
          networkExceptions = 'Unexpected error occurred';
        }
      } on FormatException {
        networkExceptions = 'Unexpected error occurred';
      } catch (_) {
        networkExceptions = 'Unexpected error occurred';
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        networkExceptions = 'Unable to process the data';
      } else {
        networkExceptions = 'Unexpected error occurred';
      }
    }
    return NetworkError(networkExceptions, statusCode);
  }
}
