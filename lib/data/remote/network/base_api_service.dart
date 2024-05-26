import 'package:dio/dio.dart';
import 'package:fluttemp/data/remote/network/network_module.dart';

abstract class BaseApiService {
  final Dio dio = NetworkModule().dio;

  // A method for making GET requests to the API.
  Future<dynamic> getResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params});

  // A method for making POST requests to the API with a JSON body and headers.
  Future<dynamic> postResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params});

  // A method for making PUT requests to the API with headers.
  Future<dynamic> putResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params});

  // A method for making PATCH requests to the API with a JSON body and headers.
  Future<dynamic> patchResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params});

  // A method for making DELETE requests to the API with headers.
  Future<dynamic> deleteResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params});

  // A method for making MultiPart POST requests to the API with a Formdata and headers.
  Future<dynamic> postMultiPartResponse(String url, FormData formData,
      {Map<String, String>? header, Map<String, dynamic>? params});
}
