// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'home_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class HomeBlocType extends RxBlocTypeBase {
  HomeBlocEvents get events;
  HomeBlocStates get states;
}

/// [$HomeBloc] extended by the [HomeBloc]
/// {@nodoc}
abstract class $HomeBloc extends RxBlocBase
    implements HomeBlocEvents, HomeBlocStates, HomeBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [ping]
  final _$pingEvent = PublishSubject<void>();

  /// The state of [isLoading] implemented in [_mapToIsLoadingState]
  late final Stream<bool> _isLoadingState = _mapToIsLoadingState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<String> _errorsState = _mapToErrorsState();

  /// The state of [pong] implemented in [_mapToPongState]
  late final Stream<Result<bool>> _pongState = _mapToPongState();

  @override
  void ping() => _$pingEvent.add(null);

  @override
  Stream<bool> get isLoading => _isLoadingState;

  @override
  Stream<String> get errors => _errorsState;

  @override
  Stream<Result<bool>> get pong => _pongState;

  Stream<bool> _mapToIsLoadingState();

  Stream<String> _mapToErrorsState();

  Stream<Result<bool>> _mapToPongState();

  @override
  HomeBlocEvents get events => this;

  @override
  HomeBlocStates get states => this;

  @override
  void dispose() {
    _$pingEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
