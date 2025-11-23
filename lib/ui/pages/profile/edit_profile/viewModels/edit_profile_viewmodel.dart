import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class EditProfileViewmodel extends ChangeNotifier {
  final AccountSecurityRepository _accountRepository;
  UsuarioResponseModel? usuario;
  bool success = false;
  late final Command1<bool, String> deleteAccountCommand;

  EditProfileViewmodel(
      {required AccountSecurityRepository accountRepository})
      : _accountRepository = accountRepository{
    deleteAccountCommand = Command1<bool, String>((password) async {
      return await deleteAccount(password);
    });
  }

  Future<void> carregarUsuario() async {
    final result = await _accountRepository.findById();
    result.fold(
          (success) {
        usuario = success;
        notifyListeners();
      },
          (failure) {
        print('Erro ao carregar usuário: $failure');
      },
    );
  }


  AsyncResult<bool> deleteAccount(String password) async {
    final result = await _accountRepository.deleteAccount(password);
    return result.mapFold(
            (onSuccess) {
          return onSuccess;
        }, (onFailure) {
      return onFailure;
    }
    );
  }
}
