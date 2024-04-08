import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ksmart/app_urls/api_endpoints.dart';

class Httpverbs {
  
  Future postVerb({
    String? endpoint,
    Map<String, String>? postData,
    Map<String, String>? headers,
    String? bearerToken,
    String? storageKeyName,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiEndpoints.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          ...?headers,
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
        body: postData,
      );
      final receivedCookie = response.headers['set-cookie'];
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      responseData.addAll({'cookie': '${extractCookieName(receivedCookie)}'});
      return responseData;
    } catch (error) {
      print('Error in postVerb: $error');
      rethrow;
    }
  }


  Future<Map<String, dynamic>> getVerb({
    String? endpoint,
    Map<String, String>? headers,
    String? bearerToken,
    String? storageKeyName,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.baseUrl}$endpoint'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          ...?headers,
          if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
        },
      );

      final responseData = jsonDecode(response.body);
      return responseData;
    } catch (error) {
      print('Error in getDataRequest: $error');
      rethrow;
    }
  }

  String? extractCookieName(String? cookie) {
    return cookie;
  }
}
