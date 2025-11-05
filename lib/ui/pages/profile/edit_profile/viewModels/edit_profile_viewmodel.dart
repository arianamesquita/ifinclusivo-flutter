import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import '../../../../../data/repositories/auth_repository.dart';

class EditProfileViewmodel extends ChangeNotifier {
  final AccountSecurityRepository _accountRepository;

  bool success = false;
  late final Command1<bool, UpdatePasswordRequestModel> updatePasswordCommand;
  late final Command1<bool, String> deleteAccountCommand;

  EditProfileViewmodel(
      {required AccountSecurityRepository accountRepository})
      : _accountRepository = accountRepository{
    updatePasswordCommand = Command1<bool, UpdatePasswordRequestModel>(changePassword);
    deleteAccountCommand = Command1<bool, String>((password) async {
      return await deleteAccount(password);
    });
  }

  AsyncResult<bool> changePassword(UpdatePasswordRequestModel updateModel) async {
    final result = await _accountRepository.updatePassword(
      updateModel,
    );
    return result.mapFold(
            (onSuccess) {
          return onSuccess;
        },
            (onFailure) {
          return onFailure;
        });
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
