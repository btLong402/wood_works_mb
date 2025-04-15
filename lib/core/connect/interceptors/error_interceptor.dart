import 'package:dio/dio.dart';
import 'dart:io';

import 'package:wood_works/core/utils/app_toast.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final errorMessage = _handleError(err);

    // Show error toast notification
    AppToast.error(
      errorMessage,
      duration: const Duration(seconds: 3),
    );

    // Continue with the error for further handling if needed
    handler.next(err);
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';

      case DioExceptionType.badResponse:
        return _handleResponseError(error.response?.statusCode);

      case DioExceptionType.cancel:
        return 'Request was cancelled';

      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return 'No internet connection. Please check your network settings.';
        }
        return 'An unexpected error occurred. Please try again later.';

      default:
        return 'Something went wrong. Please try again later.';
    }
  }

  String _handleResponseError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Access denied. You don\'t have permission for this operation.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return 'Server error (${statusCode ?? 'unknown'}). Please try again later.';
    }
  }
}
