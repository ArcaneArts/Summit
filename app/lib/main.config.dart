// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/provider/network_provider.dart' as _i3;
import 'data/provider/secure_storage_provider.dart' as _i4;
import 'data/provider/user_provider.dart' as _i5;
import 'data/repository/user_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.NetworkProvider>(() => _i3.NetworkProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i4.SecureStorageProvider>(() => _i4.SecureStorageProvider());
  gh.factory<_i5.UserProvider>(() => _i5.UserProvider(
      secure: get<bool>(), port: get<int>(), address: get<String>()));
  gh.factory<_i6.UserRepository>(() => _i6.UserRepository(
      get<_i5.UserProvider>(), get<_i4.SecureStorageProvider>()));
  return get;
}
