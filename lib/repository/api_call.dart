import 'package:neu_normal/data/remote/network/api_endpoints.dart';
import 'package:neu_normal/data/remote/network/network_api_service.dart';

class ApiRepo {
  final _apiService = NetworkApiService();

  @override
  Future<dynamic> tempApi(dynamic body) async {
    try {
      final resp = await _apiService.postResponse(ApiEndPoints.tempUrl, body);
      return resp;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
