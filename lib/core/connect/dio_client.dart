import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

  late Dio _dio;

  Dio get dio => _dio;

  void init({
    required String baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
    bool enableLogging = true,
  }) {
    Map<String, dynamic> headers0 = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (headers != null) {
      headers0.addAll(headers);
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? const Duration(seconds: 30),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
        sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        headers: headers0,
      ),
    );

    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }

    // Add logging in debug mode
    if (enableLogging && kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
      );
    }
  }
}
