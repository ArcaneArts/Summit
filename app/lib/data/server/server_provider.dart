import 'package:app/data/provider/network_provider_util.dart';

class ServerProvider extends NetworkProviderUtil
{
  ServerProvider({bool secure = true, int port = 8080, required String address})
      : super(name: "Server", address: address, port: port, secure: secure);

  Future<String?> ping() async =>
      network(response: get(at: "/api/v1/user/ping"), requestName: "Ping");
}