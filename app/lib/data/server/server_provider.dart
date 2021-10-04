import 'package:app/data/provider/network_provider_util.dart';
import 'package:injectable/injectable.dart';

class ServerProvider extends NetworkProviderUtil
{
  @Environment("dev")
  @factoryMethod
  factory ServerProvider.from() => ServerProvider(
    address: 'localhost',
    secure: true,
    port: 8080
  );

  ServerProvider({bool secure = true, int port = 8080, required String address})
      : super(name: "Server", address: address, port: port, secure: secure);

  Future<String?> ping() async => network(
      response: get(at: "/api/v1/user/ping"),
      requestName: "Ping")
          .then((value) => value?.body);
}