import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  late final Dio _dio;

  static const String _tokenKey = 'auth_token';

  AuthService() {
    final baseUrl = dotenv.env['API_BASE_URL'];
    if (baseUrl == null) {
      throw Exception("A variável BASE_URL não foi encontrada no arquivo .env");
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: '$baseUrl/auth',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final token = prefs.getString(_tokenKey);
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      '/login',
      data: {'login': email, 'senha': password},
    );
    return response.data;
  }

  Future<void> logout() async {
    try {
      await _dio.post('/logout');
    } catch (_) {
    }
  }

  Future<Map<String, dynamic>> registerTutor(
      Map<String, dynamic> tutorData,
      ) async {
    final response = await _dio.post('/register/tutor', data: tutorData);
    return response.data;
  }

  Future<String> verifyEmail(String token) async {
    final response = await _dio.get(
      '/verify-email',
      queryParameters: {'token': token},
    );
    return response.data as String;
  }

  Future<String> forgotPassword(String email) async {
    final response = await _dio.post(
      '/forgot-password',
      data: {'email': email},
    );
    return response.data as String;
  }

  Future<String> resetPassword(String token, String newPassword) async {
    final response = await _dio.post(
      '/reset-password',
      data: {'token': token, 'novaSenha': newPassword},
    );
    return response.data as String;
  }

  Future<String> updatePassword(
      String email,
      String currentPassword,
      String newPassword,
      ) async {
    final response = await _dio.post(
      '/update-password',
      data: {
        'email': email,
        'senhaAtual': currentPassword,
        'novaSenha': newPassword,
      },
    );
    return response.data as String;
  }
}