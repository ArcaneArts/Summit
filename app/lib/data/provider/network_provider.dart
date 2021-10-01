import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkProvider
{
  final bool secure;
  final int port;
  final String address;

  NetworkProvider({this.secure = true, this.port = 8080, required this.address});

  Uri url({String extension = ""})
  => Uri.parse("http${secure ? 's' : ''}://$address:$port$extension");

  Future<http.Response> post({String at = "", Object? body}) async
  => http.post(url(extension: at), body: body);

  Future<http.Response> get({String at = "", Map<String, String>? headers}) async
  => http.get(url(extension: at), headers: headers);

  Future<String?> bodyIf200(Future<http.Response> response) async =>
    response.then((value) => value.statusCode == 200 ? value.body : null);
}