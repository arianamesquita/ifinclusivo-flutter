import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/userRepository/registerRepository.dart';
import 'package:if_inclusivo/data/services/registerService.dart';
import 'package:if_inclusivo/domain/models/user/userModel.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository _repository = RegisterRepository(RegisterService());

  bool _isLoading = false;
  String? _errorMessage;
  List<UserModel> _users = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<UserModel> get users => _users;

  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _repository.getUsers();
      _users = result;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
