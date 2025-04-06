import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiResponse {
  ApiResponse({required this.data, required this.statusCode});
  final Map<String, dynamic> data;
  final int statusCode;
}

class ApiClient {
  ApiClient({required this.client});
  final http.Client client;

  Future<ApiResponse> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      log('[api client] url: $url');
      log(
        '[api client] response: ${response.body} statuscode:${response.statusCode}',
      );
      return ApiResponse(
        data: json.decode(response.body),
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('[api client] error:$e');
      throw Exception(e);
    }
  }
}
