import 'package:app/data/provider/secure_storage_provider.dart';
import 'package:app/data/provider/user_provider.dart';
import 'package:injectable/injectable.dart';

class UserRepository
{
  final UserProvider userProvider;
  final SecureStorageProvider secureStorageProvider;

  UserRepository(this.userProvider, this.secureStorageProvider);
}