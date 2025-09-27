import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


import '../../../domain/models/api/request/gen_requests.dart';
import '../../../domain/models/api/response/gen_responses.dart';
import '../../../domain/models/api/simple_model/gen_simple_models.dart';
import '../../services/auth_service.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final SharedPreferences _prefs;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';

  final _authStateController =
      StreamController<UsuarioResponseModel?>.broadcast();
  UsuarioResponseModel? _currentUser;

  AuthRepositoryImpl({
    required AuthService authService,
    required SharedPreferences sharedPreferences,
  }) : _authService = authService,
       _prefs = sharedPreferences {
    _init();
  }

  void _init() async {
    final userData = _prefs.getString(_userKey);
    final token = _prefs.getString(_tokenKey);

    if (userData != null && token != null) {
      final isExpired = JwtDecoder.isExpired(token);

      if (!isExpired && _firebaseAuth.currentUser != null) {
        _currentUser = UsuarioResponseModel.fromJson(jsonDecode(userData));
        _authStateController.add(_currentUser);
      } else {
        await _clearSession();
      }
    }
  }

  @override
  Stream<UsuarioResponseModel?> get authStateChanges =>
      _authStateController.stream;

  @override
  UsuarioResponseModel? get currentUser => _currentUser;

  @override
  Future<UsuarioResponseModel> login(String email, String password) async {
    final userJson = await _authService.login(email, password);
    print(userJson);
    final user = UsuarioResponseModel.fromJson(userJson);

    if (user.firebaseToken != null && user.firebaseToken!.isNotEmpty) {
      try {
        await _firebaseAuth.signInWithCustomToken(user.firebaseToken!);
      } on FirebaseAuthException catch (e) {
        print('Erro ao fazer login no Firebase: ${e.message}');
        throw Exception('Falha na autenticação secundária. Tente novamente.');
      }
    } else {
      throw Exception(
        'Credenciais de autenticação incompletas recebidas do servidor.',
      );
    }

    await _saveSession(user);
    _currentUser = user;
    _authStateController.add(user);
    return user;
  }

  @override
  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      print("Erro no logout da API, mas continuando com o logout local: $e");
    } finally {
      await _firebaseAuth.signOut();
      await _clearSession();
      _currentUser = null;
      _authStateController.add(null);
    }
  }

  @override
  Future<SimpleUsuarioModel> registerTutor(TutorRequestModel tutorData) async {
    final json = await _authService.registerTutor(tutorData.toJson());
    print(json);
    return SimpleUsuarioModel.fromJson(json);
  }

  @override
  Future<String> forgotPassword(String email) {
    return _authService.forgotPassword(email);
  }

  @override
  Future<String> resetPassword(String token, String newPassword) {
    return _authService.resetPassword(token, newPassword);
  }

  Future<void> _saveSession(UsuarioResponseModel user) async {
    if (user.token != null) {
      await _prefs.setString(_tokenKey, user.token!);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));
    }
  }

  Future<void> _clearSession() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_userKey);
  }

  void dispose() {
    _authStateController.close();
  }

  @override
  Future<String> verifyEmail(String token) {
    return _authService.verifyEmail(token);
  }
}
