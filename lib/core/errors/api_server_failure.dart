import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

class ApiServerFailure extends Failure {
  ApiServerFailure({required super.message});

  factory ApiServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ApiServerFailure(message: 'Connection timeout with server.');
      case DioExceptionType.sendTimeout:
        return ApiServerFailure(message: 'Send data timeout with server.');
      case DioExceptionType.receiveTimeout:
        return ApiServerFailure(message: 'Receive data timeout with server.');
      case DioExceptionType.badCertificate:
        return ApiServerFailure(message: 'Bad certificate.');
      case DioExceptionType.badResponse:
        return ApiServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ApiServerFailure(message: 'Connection canceled.');
      case DioExceptionType.connectionError:
        return ApiServerFailure(message: 'No internet connection.');
      case DioExceptionType.unknown:
        return ApiServerFailure(
          message: 'Unexpected error, please try again later.',
        );
    }
  }

  factory ApiServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ApiServerFailure(message: 'Request not found, try again later.');
    } else if (statusCode == 404) {
      return ApiServerFailure(message: 'Request not found, try again later.');
    } else if (statusCode == 500) {
      return ApiServerFailure(
        message: 'Internal server error, try again later.',
      );
    } else {
      return ApiServerFailure(
        message: 'Oops! there was an error, please try again.',
      );
    }
  }
}
