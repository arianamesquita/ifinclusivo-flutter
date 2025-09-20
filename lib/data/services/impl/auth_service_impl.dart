import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:if_inclusivo/data/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthServiceImpl implements AuthService{
  late final Dio _dio;
// O construtor recebe o Dio GLOBAL que foi criado no Provider
  AuthServiceImpl(Dio globalDio) {
    _dio = Dio();
    _dio.options = globalDio.options;
    _dio.options.baseUrl = '${globalDio.options.baseUrl}/auth';
    _dio.interceptors.addAll(globalDio.interceptors);
  }

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      '/login',
      data: {'login': email, 'senha': password},
    );
    return response.data;
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('/logout');
    } catch (_) {
    }
  }
  @override
  Future<Map<String, dynamic>> registerTutor(
      Map<String, dynamic> tutorData,
      ) async {
    final response = await _dio.post('/register/tutor', data: tutorData);
    return response.data;
  }
  @override
  Future<String> verifyEmail(String token) async {
    final response = await _dio.get(
      '/verify-email',
      queryParameters: {'token': token},
    );
    return response.data as String;
  }
  @override
  Future<String> forgotPassword(String email) async {
    final response = await _dio.post(
      '/forgot-password',
      data: {'email': email},
    );
    return response.data as String;
  }
  @override
  Future<String> resetPassword(String token, String newPassword) async {
    final response = await _dio.post(
      '/reset-password',
      data: {'token': token, 'novaSenha': newPassword},
    );
    return response.data as String;
  }
  @override
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