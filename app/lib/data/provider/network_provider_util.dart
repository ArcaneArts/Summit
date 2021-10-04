import 'package:app/util/l.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkProviderUtil
{
  final bool secure;
  final int port;
  final String address;
  final String name;

  NetworkProviderUtil({required this.name, this.secure = true, this.port = 8080, required this.address});

  Uri url({String extension = ""})
  => Uri.parse("http${secure ? 's' : ''}://$address:$port$extension");

  Future<http.Response> post({String at = "", Object? body}) async
  => http.post(url(extension: at), body: body);

  Future<http.Response> get({String at = "", Map<String, String>? headers}) async
  => http.get(url(extension: at), headers: headers);

  Future<http.Response?> network({required Future<http.Response> response, String requestName = "Unknown Request?", int timeoutMs = 15000})
  {
    return response
        .then((value) {
      if(value.statusCode != 200)
        {
          L.e("============== REPO HTTPX ERROR ===============");
          L.e("Repository: $name (${runtimeType.toString()})");
          L.e("Request: $requestName");
          L.e("Request URL: ${value.request!.url.toString()}");
          L.e("Request Method: ${value.request!.method.toString()}");
          L.e("Request Headers: ${value.request!.headers}");
          L.e("Status: $value");
          L.e("Headers: ${value.headers}");
          L.e("Reason: ${value.reasonPhrase}");
          L.e("Body: ${value.body}");
          L.e("Redirect: ${value.isRedirect}");
          L.e("----------------------------------------------");
          return null;
        }
      else
        {
          L.i("Request: " + requestName + " Response: " + value.toString());
        }

      return value;
    }).onError((error, stackTrace) {
      L.e("================= REPO ERROR =================");
      L.e("Repository: $name (${runtimeType.toString()})");
      L.e("Request: $requestName");
      L.e("Error: $error");
      L.e("Stack: $stackTrace");
      L.e("----------------------------------------------");
      return null;
    }).timeout(Duration(milliseconds: timeoutMs), onTimeout: () {
      L.e("================ REPO TIMEOUT ================");
      L.e("Repository: $name (${runtimeType.toString()})");
      L.e("Request: $requestName");
      L.e("----------------------------------------------");
      return null;
    });
  }
}