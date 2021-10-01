// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/provider/network_provider.dart' as _i3;
import 'data/provider/secure_storage_provider.dart' as _i4;
import 'data/repository/repository.dart' as _i7;
import 'data/server/server_provider.dart' as _i5;
import 'data/server/server_repository.dart' as _i6;
import 'data/user/user_provider.dart' as _i8;
import 'data/user/user_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.NetworkProvider>(() => _i3.NetworkProvider(
      name: get<String>(),
      secure: get<bool>(),
      port: get<int>(),
      address: get<String>()));
  gh.factory<_i4.SecureStorageProvider>(() => _i4.SecureStorageProvider());
  gh.factory<_i5.ServerProvider>(() => _i5.ServerProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i6.ServerRepository>(
      () => _i6.ServerRepository(get<_i5.ServerProvider>()));
  gh.factory<_i7.SummitRepository>(() => _i7.SummitRepository(get<String>()));
  gh.factory<_i8.UserProvider>(() => _i8.UserProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i9.UserRepository>(() => _i9.UserRepository(
      get<_i8.UserProvider>(), get<_i4.SecureStorageProvider>()));
  return get;
}
