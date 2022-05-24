
import 'network_request.dart';

class NetworkPre {
  Map<String, dynamic>? queryParam;

  NetworkPre({
    this.queryParam,
  });
}

abstract class INetworkTaskResolver {
  NetworkRequest getTask(String identifier);

  Future<Map<String, dynamic>> headers(String identifier);

  Future<Map<String, dynamic>> params(String identifier);
}
