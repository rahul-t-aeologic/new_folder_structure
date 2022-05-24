
import 'network_error.dart';

abstract class IErrorModel {
  NetworkError getNetworkError(Map<String, dynamic> json);
}
