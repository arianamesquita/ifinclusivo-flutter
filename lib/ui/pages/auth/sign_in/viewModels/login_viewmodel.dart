import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/userRepository/auth_repository.dart';

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