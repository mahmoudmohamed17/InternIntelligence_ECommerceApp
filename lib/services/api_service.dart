import 'package:dio/dio.dart';

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
}
