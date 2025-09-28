import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
enum ResetPasswordState {
  idle,
  loading,
  success,
  invalidToken,
  expiredToken,
  serverError,
}

class ResetPasswordViewModel extends ChangeNotifier{
  ResetPasswordViewModel({required AuthRepository authRepository}) : _repository = authRepository;
  final AuthRepository _repository;


  ResetPasswordState _state = ResetPasswordState.idle;
  ResetPasswordState get state => _state;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;




  Future<void> verifyEmail(String token, String password) async {
    _state = ResetPasswordState.loading;
    notifyListeners();

    try {
      await _repository.resetPassword(token, password);
      _state = ResetPasswordState.success;

    } on DioException catch (e) {

      switch (e.response?.statusCode) {
        case 400:
          _state = ResetPasswordState.invalidToken;
          _errorMessage = "O token é inválido.";
          break;

        case 404:
          _state = ResetPasswordState.invalidToken;
          _errorMessage = "Usuario não encontrado";
          break;

        case 410:
          _state = ResetPasswordState.expiredToken;
          _errorMessage = "O link expirou.";
          break;
        default:
          _state = ResetPasswordState.serverError;
          _errorMessage = "Erro no servidor. Tente mais tarde.";
      }
    } catch (e) {
      _state = ResetPasswordState.serverError;
      _errorMessage = "Ocorreu um erro desconhecido.";
    } finally {
      notifyListeners();
    }
  }

  void resetState() {
    _state = ResetPasswordState.idle;
    notifyListeners();
  }
}