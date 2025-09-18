import 'package:flutter/material.dart';
import 'package:if_inclusivo/data/repositories/userRepository/auth_repository.dart';
import 'package:if_inclusivo/domain/models/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/simple_model/gen_simple_models.dart';

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

  Future<bool> registerNewTutor() async {
    _isLoading = true;
    _errorMessage = null;
    _registeredUser = null;
    notifyListeners();

    try {
      final tutorData = TutorRequestModel(
        nome: 'nome',
        login: 'pedrojferreiradev@gmail.com',
        senha: "1236d458",
        matricula: 123,
        especialidade: 'especialidade',
      );

      // 2. Chama o método do repositório
      final result = await _repository.registerTutor(tutorData);
      _registeredUser = result;

      print('✅ Registro de Tutor bem-sucedido! Resposta: $result');
      return true;
    } catch (e) {
      // 3. Captura e armazena qualquer erro que ocorra
      _errorMessage = e.toString();
      print('❌ Erro ao registrar tutor: $_errorMessage');
      return false;
    } finally {
      // 4. Garante que o estado de loading seja desativado
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
