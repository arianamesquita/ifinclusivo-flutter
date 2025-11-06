import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/config/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/auth_repository.dart';
import '../routing/app_router.dart';

class DioConfig {
  static Dio createDio(
      SharedPreferences prefs,
      AuthRepository authRepository,
      GoRouter router,
      ) {
    final baseUrl = Environment.baseUrl;


    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = prefs.getString('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response != null) {
            final statusCode = e.response!.statusCode;
            if (statusCode == 401) {
              await authRepository.logout();
              router.go(UnauthorizedRoute().location);
            } else if (statusCode == 403) {
              router.push(ForbiddenRoute().location);
            }else if (statusCode == 404) {
              router.go(NotFoundRoute().location);
            } else if (statusCode == 500) {
              router.push(ServerErrorRoute().location);
            }
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
