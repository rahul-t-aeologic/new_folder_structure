import 'base_model.dart';
import 'network_methods.dart';

class NetworkRequest {
  final BaseModel baseModel;
  final String apiPath;
  final String apiIdentifier;
  final Methods requestMethod;
  final Map<String, dynamic>? addHeaders;
  final Map<String, dynamic>? params;
  final bool authRequired;

  NetworkRequest({
    required this.apiPath,
    required this.apiIdentifier,
    required this.baseModel,
    this.addHeaders,
    this.params,
    this.requestMethod = Methods.get,
    this.authRequired = false,
  });
}
