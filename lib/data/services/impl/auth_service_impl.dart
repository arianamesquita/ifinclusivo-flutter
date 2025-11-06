import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:if_inclusivo/config/environment.dart';
import 'package:if_inclusivo/data/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl implements AuthService {
  late final Dio _dio;
  AuthServiceImpl() {
    init();
  }

  void init() {
    final baseUrl = Environment.baseUrl;
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  final basePath = '/auth';

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      '$basePath/login',
      data: {'login': email, 'senha': password},
    );
    return response.data;
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post('$basePath/logout');
    } catch (_) {}
  }

  @override
  Future<Map<String, dynamic>> registerTutor(
    Map<String, dynamic> tutorData,
  ) async {
    final response = await _dio.post(
      '$basePath/register/tutor',
      data: tutorData,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> registerProfessor(
      Map<String, dynamic> professorData,
      ) async {
    final response = await _dio.post(
      '$basePath/register/professor',
      data: professorData,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> registerInterprete(
      Map<String, dynamic> interpreteData,
      ) async {
    final response = await _dio.post(
      '$basePath/register/interprete',
      data: interpreteData,
    );
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> registerAluno(
      Map<String, dynamic> alunoData,
      ) async {
    final response = await _dio.post(
      '$basePath/register/aluno',
      data: alunoData,
    );
    return response.data;
  }

  @override
  Future<String> verifyEmail(String token) async {
    final response = await _dio.get(
      '$basePath/verify-email',
      queryParameters: {'token': token},
    );
    return response.data as String;
  }

  @override
  Future<String> forgotPassword(String email) async {
    final response = await _dio.post(
      '$basePath/forgot-password',
      data: {'email': email},
    );
    return response.data as String;
  }

  @override
  Future<String> resetPassword(String token, String newPassword) async {
    final response = await _dio.post(
      '$basePath/reset-password',
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
      '$basePath/update-password',
      data: {
        'email': email,
        'senhaAtual': currentPassword,
        'novaSenha': newPassword,
      },
    );
    return response.data as String;
  }
}
