import 'dart:io';

class AppNetworkConstants {
  static const baseURL = "localhost.com:3000/";

  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}
