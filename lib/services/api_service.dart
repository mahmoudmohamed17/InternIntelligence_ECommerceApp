import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/custom_exception.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/products/',
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Map<String, dynamic>> getCategoryProducts({
    required String endpoint,
  }) async {
    var response = await _dio.get(endpoint);
    return response.data;
  }

  Future<Response> post({
    required body,
    required String url,
    required String token,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    try {
      var response = await _dio.post(
        url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } on DioException catch (e) {
      log('Error message from post method: ${e.response!.data.toString()}');
      throw CustomException(
        message: e.response!.data['error']['message'] ?? 'Unknown error',
      );
    } catch (e) {
      log(
        'Error message from post method: ${extensionStreamHasListener.toString()}',
      );
      throw CustomException(message: e.toString());
    }
  }
}
