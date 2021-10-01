import 'package:app/data/server/server_provider.dart';

class ServerRepository
{
  final ServerProvider serverProvider;

  ServerRepository(this.serverProvider);

  Future<bool> ping() async
  {
    return serverProvider.ping().then((value) {
      if(value == null)
        {
          return false;
        }

      return true;
    });
  }
}