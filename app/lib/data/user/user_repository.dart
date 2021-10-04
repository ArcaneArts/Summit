import 'dart:convert';

import 'package:app/data/provider/secure_storage_provider.dart';
import 'package:app/data/repository/repository.dart';
import 'package:app/data/user/user.dart';
import 'package:app/data/user/user_provider.dart';
import 'package:injectable/injectable.dart';

class UserRepository extends SummitRepository
{
  final UserProvider userProvider;
  final SecureStorageProvider secureStorageProvider;

  UserRepository(this.userProvider, this.secureStorageProvider) : super("User");

  Future<User?> register({
    required String firstName,
    required String lastName,
    required String username,
    required String password}) async
  {
    return userProvider.register(
        firstName: firstName,
        lastName: lastName,
        username: username,
        password: password)
        .then((value) {
          if(value != null)
            {
              return User.fromJson(jsonDecode(value));
            }

          return null;
    });
  }
}