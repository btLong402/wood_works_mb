import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wood_works/core/constants/app_constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage);

  final GetStorage _storage;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final cookies = _getCookies();
    if (cookies.isNotEmpty) {
      options.headers['Cookie'] = cookies;
    }
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final cookies = response.headers['set-cookie'];
    if (cookies != null && cookies.isNotEmpty) {
      _saveCookies(cookies);
    }
    return handler.next(response);
  }

  String _getCookies() {
    String cookie =
        '${_storage.read(AppConstants.accessToken) ?? ''};${_storage.read(AppConstants.refreshToken) ?? ''}';
    return cookie != ';' ? cookie : '';
  }

  void _saveCookies(List<String> cookies) {
    for (var cookie in cookies) {
      if (cookie.contains('access_token=')) {
        _storage.write(AppConstants.accessToken, cookie);
      } else if (cookie.contains('refresh_token=')) {
        _storage.write(AppConstants.refreshToken, cookie);
      }
    }
  }
}
