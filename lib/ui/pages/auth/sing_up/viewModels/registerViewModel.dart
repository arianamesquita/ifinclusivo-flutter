import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';


import '../../../../../domain/models/api/request/gen_requests.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/api/simple_model/gen_simple_models.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel({required AuthRepository repository})
    : _repository = repository;

  final AuthRepository _repository;

  bool _isLoading = false;
  String? _errorMessage;
  List<UsuarioResponseModel> _users = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<UsuarioResponseModel> get users => _users;

  SimpleUsuarioModel? _registeredUser;

  Future<bool> registerNewTutor(TutorRequestModel tutor) async {
    _isLoading = true;
    _errorMessage = null;
    _registeredUser = null;
    notifyListeners();
    try {
      final result = await _repository.registerTutor(tutor);
      _registeredUser = result;
      print('✅ Registro de Tutor bem-sucedido! Resposta: $result');
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      print('❌ Erro ao registrar tutor: $_errorMessage');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerNewProfessor(ProfessorRequestModel professor) async {
    _isLoading = true;
    _errorMessage = null;
    _registeredUser = null;
    notifyListeners();
    try {
      final result = await _repository.registerProfessor(professor);
      _registeredUser = result;
      print('✅ Registro de Tutor bem-sucedido! Resposta: $result');
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      print('❌ Erro ao registrar tutor: $_errorMessage');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerNewInterprete(InterpreteRequestModel interprete) async {
    _isLoading = true;
    _errorMessage = null;
    _registeredUser = null;
    notifyListeners();
    try {
      final result = await _repository.registerInterprete(interprete);
      _registeredUser = result;
      print('✅ Registro de Tutor bem-sucedido! Resposta: $result');
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      print('❌ Erro ao registrar tutor: $_errorMessage');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerNewAluno(AlunoRequestModel aluno) async {
    _isLoading = true;
    _errorMessage = null;
    _registeredUser = null;
    notifyListeners();
    try {
      final result = await _repository.registerAluno(aluno);
      _registeredUser = result;
      print('✅ Registro de Tutor bem-sucedido! Resposta: $result');
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      print('❌ Erro ao registrar tutor: $_errorMessage');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadUsers() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      /*      final result = await _repository.getUsers();
      _users = result;*/
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
