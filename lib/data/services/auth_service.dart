/*
// Salve em: lib/data/services/auth_service.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  late final Dio _dio;
  UserModel? _currentUser;
  bool _isLoggedIn = false;

  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  String? get token => _currentUser?.token;

  // Chaves para o SharedPreferences
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';

  AuthService() {
    // Configuração base do Dio
    _dio = Dio(BaseOptions(
      baseUrl: 'https://sua-api.com', // ⚠️ SUBSTITUA PELA URL DA SUA API
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    // O INTERCEPTOR MÁGICO!
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Adiciona o token de autorização a TODAS as requisições se o usuário estiver logado
        if (isLoggedIn && token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        // Se receber um erro 401 (Token Expirado), desloga o usuário
        if (e.response?.statusCode == 401) {
          await logout();
        }
        return handler.next(e);
      },
    ));

    // Tenta carregar a sessão do usuário assim que o serviço é iniciado
    init();
  }

  /// Carrega o token e os dados do usuário do SharedPreferences na inicialização.
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    final userData = prefs.getString(_userKey);

    if (token != null && userData != null) {
      _currentUser = UserModel.fromJson(jsonDecode(userData));
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  /// Salva os dados do usuário e o token no SharedPreferences.
  Future<void> _saveSession(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, user.token);
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  /// Limpa a sessão do SharedPreferences.
  Future<void> _clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  // --- MÉTODOS DA API ---

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'login': email,
        'senha': password,
      });

      final user = UserModel.fromJson(response.data);
      _currentUser = user;
      _isLoggedIn = true;
      await _saveSession(user);

      notifyListeners(); // Notifica a UI que o estado mudou
      return user;
    } on DioException {
      // Você pode tratar o erro aqui de forma mais específica se quiser
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post('/logout');
    } finally {
      // Limpa a sessão localmente, mesmo que a chamada de API falhe
      _currentUser = null;
      _isLoggedIn = false;
      await _clearSession();
      notifyListeners(); // Notifica a UI
    }
  }

  // Retorna o DTO simples, não loga o usuário
  Future<Map<String, dynamic>> registerTutor(Map<String, dynamic> tutorData) async {
    final response = await _dio.post('/register/tutor', data: tutorData);
    return response.data;
  }

  Future<String> verifyEmail(String token) async {
    final response = await _dio.get('/verify-email', queryParameters: {'token': token});
    return response.data as String;
  }

  Future<String> forgotPassword(String email) async {
    final response = await _dio.post('/forgot-password', data: {'email': email});
    return response.data as String;
  }

  Future<String> resetPassword(String token, String newPassword) async {
    final response = await _dio.post('/reset-password', data: {
      'token': token,
      'novaSenha': newPassword,
    });
    return response.data as String;
  }

  Future<String> updatePassword(String email, String currentPassword, String newPassword) async {
    final response = await _dio.post('/update-password', data: {
      'email': email,
      'senhaAtual': currentPassword,
      'novaSenha': newPassword,
    });
    return response.data as String;
  }
}*/
