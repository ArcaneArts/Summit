import 'package:app/data/provider/network_provider.dart';

class ServerProvider extends NetworkProvider
{
  ServerProvider({bool secure = true, int port = 8080, required String address})
      : super(name: "Server", address: address, port: port, secure: secure);

  Future<String?> ping() async =>
      network(response: get(at: "/api/v1/user/ping"), requestName: "Ping");
}