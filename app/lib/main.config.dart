// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/provider/secure_storage_provider.dart' as _i3;
import 'data/repository/repository.dart' as _i6;
import 'data/server/server_provider.dart' as _i4;
import 'data/server/server_repository.dart' as _i5;
import 'data/user/user_provider.dart' as _i7;
import 'data/user/user_repository.dart' as _i8;
import 'logic/home/home_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.SecureStorageProvider>(() => _i3.SecureStorageProvider());
  gh.factory<_i4.ServerProvider>(() => _i4.ServerProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i5.ServerRepository>(
      () => _i5.ServerRepository(get<_i4.ServerProvider>()));
  gh.factory<_i6.SummitRepository>(() => _i6.SummitRepository(get<String>()));
  gh.factory<_i7.UserProvider>(() => _i7.UserProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i8.UserRepository>(() => _i8.UserRepository(
      get<_i7.UserProvider>(), get<_i3.SecureStorageProvider>()));
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(get<_i5.ServerRepository>()));
  return get;
}
