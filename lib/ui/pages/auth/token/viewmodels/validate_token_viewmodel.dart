import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/userRepository/auth_repository.dart';
enum TokenValidationState {
  loading,
  success,
  invalidToken,
  expiredToken,
  serverError,
}

class ValidateTokenViewModel extends ChangeNotifier {
  ValidateTokenViewModel({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  TokenValidationState _state = TokenValidationState.loading;
  TokenValidationState get state => _state;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<void> verifyEmail(String token) async {
    _state = TokenValidationState.loading;
    notifyListeners();

    try {
      await _repository.verifyEmail(token);
      _state = TokenValidationState.success;

    } on DioException catch (e) {

      switch (e.response?.statusCode) {
        case 400:
          _state = TokenValidationState.invalidToken;
          _errorMessage = "O token é inválido.";
          break;
        case 410:
          _state = TokenValidationState.expiredToken;
          _errorMessage = "O link expirou.";
          break;
        default:
          _state = TokenValidationState.serverError;
          _errorMessage = "Erro no servidor. Tente mais tarde.";
      }
    } catch (e) {
      _state = TokenValidationState.serverError;
      _errorMessage = "Ocorreu um erro desconhecido.";
    } finally {
      notifyListeners();
    }
  }
  void handleInvalidToken() {
    _state = TokenValidationState.invalidToken;
    _errorMessage = "Token não fornecido na URL.";
    notifyListeners();
  }
}

