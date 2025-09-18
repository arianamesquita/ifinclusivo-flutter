import 'dart:async';
import 'dart:convert';
import 'package:if_inclusivo/domain/models/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/simple_model/gen_simple_models.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../domain/models/response/gen_responses.dart';
import '../../services/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final SharedPreferences _prefs;


  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';

  final _authStateController = StreamController<UsuarioResponseModel?>.broadcast();
  UsuarioResponseModel? _currentUser;

  AuthRepositoryImpl({
    required AuthService authService,
    required SharedPreferences sharedPreferences,
  })  : _authService = authService,
        _prefs = sharedPreferences {
    _init();
  }

  void _init() {
    final userData = _prefs.getString(_userKey);
    if (userData != null) {
      _currentUser = UsuarioResponseModel.fromJson(jsonDecode(userData));
      _authStateController.add(_currentUser);
    }
  }

  @override
  Stream<UsuarioResponseModel?> get authStateChanges => _authStateController.stream;

  @override
  UsuarioResponseModel? get currentUser => _currentUser;

  @override
  Future<UsuarioResponseModel> login(String email, String password) async {
    final userJson = await _authService.login(email, password);
    final user = UsuarioResponseModel.fromJson(userJson);
    await _saveSession(user);
    _currentUser = user;
    _authStateController.add(user);
    return user;
  }

  @override
  Future<void> logout() async {
    try {
      await _authService.logout();
    } finally {
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
}