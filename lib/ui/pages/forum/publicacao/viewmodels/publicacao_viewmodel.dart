import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';

class PublicacaoViewModel extends ChangeNotifier {
  PublicacaoViewModel({
    required ForumRepository forumRepository,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository,
       _forumRepository = forumRepository {
    fetchPublicationCommand = Command1<PublicacaoDetalhadaModel, int>(
      _fetchPublication,
    );
    fetchRespostasCommand =
        Command2<List<ComentarioResponseModel>, int, Ordenacao>(
          _fetchRespostas,
        );
    currentUser = _authRepository.currentUser;
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      currentUser = user;
      notifyListeners();
    });
  }

  final ForumRepository _forumRepository;
  final AuthRepository _authRepository;



  UsuarioResponseModel? currentUser;

  StreamSubscription<UsuarioResponseModel?>? get authSubscription =>
      _authSubscription;
  StreamSubscription<UsuarioResponseModel?>? _authSubscription;
  bool isDeleted = false;
  bool showDeletedSnack = false;
  bool showErrorSnack = false;
  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  PublicacaoDetalhadaModel? _publication;
  PublicacaoDetalhadaModel? get publication => _publication;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<ComentarioResponseModel> _respostas = [];
  List<ComentarioResponseModel> get respostas => _respostas;

  late final Command1<PublicacaoDetalhadaModel, int> fetchPublicationCommand;
  late final Command2<List<ComentarioResponseModel>, int, Ordenacao>
  fetchRespostasCommand;

  double scrollOffset = 0.0;

  AsyncResult<void> deletePublication(int id) async {
    final result = await _forumRepository.delete(id);
    return result.mapFold((onSuccess) {
      if (_publication != null) {
        _publication = null;
        notifyListeners();
      }
      return Null;
    }, (onFailure) => onFailure);
  }

  // 🔹 Deletar resposta da lista
  AsyncResult<void> deleteResposta(int id) async {
    final result = await _forumRepository.delete(id);
    return result.mapFold(
      (onSuccess) {
        _respostas = _respostas.toList();
        _respostas.removeWhere((r) => r.id == id);
        showDeletedSnack = true;
        notifyListeners();
        return Null;
      },
      (onFailure) {
        showDeletedSnack = true;
        notifyListeners();
        return onFailure;
      },
    );
  }

  AsyncResult<PublicacaoDetalhadaModel> _fetchPublication(int id) async {
    final result = await _forumRepository.findById(id);
    return result.mapFold(
      (onSuccess) {
        _publication = onSuccess;
        notifyListeners();
        return onSuccess;
      },
      (onFailure) {
        _errorMessage = onFailure.toString();
        notifyListeners();
        return onFailure;
      },
    );
  }

  AsyncResult<List<ComentarioResponseModel>> _fetchRespostas(
    int id,
    Ordenacao order,
  ) async {
    final result = await _forumRepository.findComments(
      id: id,
      ordenarPor: order,
      page: 0,
      size: 10,
    );
    return result.mapFold(
      (onSuccess) {
        _respostas = onSuccess.content;
        notifyListeners();
        return onSuccess.content;
      },
      (onFailure) {
        _errorMessage = onFailure.toString();
        notifyListeners();
        return onFailure;
      },
    );
  }
}
