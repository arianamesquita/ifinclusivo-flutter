import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';
import '../../../../../data/repositories/auth_repository.dart';

class AccountSecurityViewModel extends ChangeNotifier {
  final AccountSecurityRepository _accountRepository;

  bool isLoading = false;
  String? errorMessage;
  bool success = false;
  late final Command1<bool, UpdatePasswordRequestModel> updatePasswordCommand;

  AccountSecurityViewModel(
      {required AccountSecurityRepository accountRepository})
      : _accountRepository = accountRepository{
    updatePasswordCommand = Command1<bool, UpdatePasswordRequestModel>(changePassword);
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

  Future<void> deleteAccount() async {
    isLoading = true;
    errorMessage = null;
    success = false;
    notifyListeners();

    try {
      await _accountRepository.deleteAccount();
      success = true;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
