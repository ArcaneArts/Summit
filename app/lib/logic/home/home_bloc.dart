import 'package:app/data/server/server_repository.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_bloc.rxb.g.dart';

/// A contract class containing all events of the HomeBloC.
abstract class HomeBlocEvents {
  void ping();
}

/// A contract class containing all states of the HomeBloC.
abstract class HomeBlocStates {
  /// The loading state
  Stream<bool> get isLoading;

  /// The error state
  Stream<String> get errors;

  Stream<Result<bool>> get pong;
}

@RxBloc()
class HomeBloc extends $HomeBloc {

  final ServerRepository server;

  HomeBloc(this.server);

  @override
  Stream<Result<bool>> _mapToPongState() => _$pingEvent
      .startWith(null)
      .throttleTime(const Duration(milliseconds: 200))
      .switchMap((value) async* {
        yield Result<bool>.loading();
        yield await server.ping();
      })
      .setResultStateHandler(this)
      .shareReplay(maxSize: 1);

  /// TODO: Implement error event-to-state logic
  @override
  Stream<String> _mapToErrorsState() =>
      errorState.map((error) => error.toString());

  @override
  Stream<bool> _mapToIsLoadingState() => loadingState;
}
