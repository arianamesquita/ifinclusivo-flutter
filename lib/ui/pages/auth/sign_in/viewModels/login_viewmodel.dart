import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../utils/before_unload_manager.dart';
enum EmailState{
  idle,
  loading,
  success,
  error
}
class LoginViewModel extends ChangeNotifier{
  final AuthRepository _authRepository;
  LoginViewModel({required AuthRepository authRepository}) : _authRepository = authRepository;

  final BeforeUnloadManager _unloadManager = BeforeUnloadManager();
  EmailState _emailState = EmailState.idle;
  EmailState get emailState => _emailState;

  final ValueNotifier<bool> isLogged = ValueNotifier<bool>(false);

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
      final UsuarioResponseModel result = await _authRepository
          .login(credentials.login, credentials.senha);
      debugPrint("Login realizado com sucesso");
      isLogged.value = true;
      return true;
    } on DioException catch (e){
      debugPrint("Erro ${e.response?.statusCode ?? ''} : ${e.message}");
      isLogged.value = false;
      return false;
    } catch (e) {
      debugPrint("Erro inesperado no login");
      isLogged.value = false;
      notifyListeners();
      return false;
    }
  }

  void resetState() {
    _setEmailState(EmailState.idle);
  }

  void _setEmailState(EmailState newState) {
    if (newState == EmailState.loading) {
      _unloadManager.enable( 'Enviando e-mail... Deseja sair agora?');
    } else {
      _unloadManager.disable();
    }
    _emailState = newState;
    notifyListeners();
  }
}