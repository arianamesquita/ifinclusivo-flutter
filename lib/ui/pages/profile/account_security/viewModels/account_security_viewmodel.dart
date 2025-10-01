import 'package:flutter/material.dart';
import '../../../../../data/repositories/auth_repository.dart';

class AccountSecurityViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  bool isLoading = false;
  String? errorMessage;
  bool success = false;

  AccountSecurityViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  // Future<void> changePassword({
  //   required String oldPassword,
  //   required String newPassword,
  // }) async {
  //   isLoading = true;
  //   errorMessage = null;
  //   success = false;
  //   notifyListeners();
  //
  //   try {
  //     await _authRepository.changePassword(
  //       oldPassword: oldPassword,
  //       newPassword: newPassword,
  //     );
  //     success = true;
  //   } catch (e) {
  //     errorMessage = e.toString();
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }
  //
  // Future<void> deleteAccount() async {
  //   isLoading = true;
  //   errorMessage = null;
  //   success = false;
  //   notifyListeners();
  //
  //   try {
  //     await _authRepository.deleteAccount();
  //     success = true;
  //   } catch (e) {
  //     errorMessage = e.toString();
  //   } finally {
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
