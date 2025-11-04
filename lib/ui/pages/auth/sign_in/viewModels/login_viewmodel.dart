import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';

enum EmailState{
  idle,
  loading,
  success,
  error
}
class LoginViewModel extends ChangeNotifier{
  final AuthRepository _authRepository;
  LoginViewModel({required AuthRepository authRepository}) : _authRepository = authRepository{
    _initAuthListener();
  }
  EmailState _emailState = EmailState.idle;
  EmailState get emailState => _emailState;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  StreamSubscription<UsuarioResponseModel?>? _authSubscription;

  void _initAuthListener() {
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      if (user == null) {
        _isLoggedIn = false;
        notifyListeners();
      }
    });
  }
  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }


  sendToken(email) async {
    _setEmailState(EmailState.loading);
    notifyListeners();
    try {
      await _authRepository.forgotPassword(email);
      _setEmailState(EmailState.success);
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 404:
          _setEmailState(EmailState.error);
          break;
        default:
          _setEmailState(EmailState.error);
      }
    } catch (e) {
      _setEmailState(EmailState.error);
    } finally {
      notifyListeners();
    }
  }

  Future<bool> login(LoginRequestModel credentials) async {
    try {
      await _authRepository.login(credentials.login, credentials.senha);
      debugPrint("Login realizado com sucesso");
      _isLoggedIn = true;
      return true;
    } on DioException catch (e){
      debugPrint("Erro ${e.response?.statusCode ?? ''} : ${e.message}");
      _isLoggedIn = false;
      return false;
    } catch (e) {
      debugPrint("Erro inesperado no login ${e.toString()}");
      _isLoggedIn = false;
      return false;
    }finally{
      notifyListeners();
    }
  }

  void resetState() {
    _setEmailState(EmailState.idle);
  }

  void _setEmailState(EmailState newState) {
    _emailState = newState;
    notifyListeners();
  }
}