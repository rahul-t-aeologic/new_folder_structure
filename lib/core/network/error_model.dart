import 'i_error_model.dart';
import 'network_error.dart';

class ErrorModel extends IErrorModel {
  @override
  NetworkError getNetworkError(Map<String, dynamic> json) {
    return NetworkError(json['message'], json['statusCode']);
  }
}
