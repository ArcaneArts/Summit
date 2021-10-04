import 'package:app/data/server/server_provider.dart';
import 'package:rx_bloc/rx_bloc.dart';

class ServerRepository
{
  final ServerProvider serverProvider;

  ServerRepository(this.serverProvider);

  Future<Result<bool>> ping() async
  {
    return serverProvider.ping().then((value) {
      if(value == null)
        {
          return Result.error(Exception('null response'));
        }

      return Result.success(true);
    });
  }
}