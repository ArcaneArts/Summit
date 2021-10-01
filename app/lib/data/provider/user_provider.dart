import 'package:app/data/provider/network_provider.dart';
import 'package:injectable/injectable.dart';

class UserProvider extends NetworkProvider
{
  UserProvider({bool secure = true, int port = 8080, required String address})
      : super(secure: secure, port: port, address: address);

  Future<String?> register(
      {required String firstName,
        required String lastName,
        required String username,
        required String password}) async =>
     bodyIf200(post(at: "/register", body: {
       "username": username,
       "password": password,
       "firstName": firstName,
       "lastName": lastName
     }));

  Future<String?> login({required String username, required String password}) async
    => bodyIf200(post(at: "/login", body: {
    "username": username,
        "password": password
      }));
}