import 'package:app/data/provider/network_provider_util.dart';
import 'package:injectable/injectable.dart';

class UserProvider extends NetworkProviderUtil
{
  UserProvider({bool secure = true, int port = 8080, required String address})
      : super(name: "User", secure: secure, port: port, address: address);

  Future<String?> register(
      {required String firstName,
        required String lastName,
        required String username,
        required String password}) async =>
     network(response: post(at: "/api/v1/user/register", body: {
       "username": username,
       "password": password,
       "firstName": firstName,
       "lastName": lastName
     }), requestName: "Register").then((value) => value?.body);

  Future<String?> login({required String username, required String password}) async =>
     network(response: post(at: "/api/v1/user/login", body: {
      "username": username,
      "password": password
    }), requestName: "Login").then((value) => value?.body);
}