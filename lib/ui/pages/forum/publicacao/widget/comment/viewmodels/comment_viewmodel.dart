import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../../../data/repositories/auth_repository.dart';

class CommentViewModel extends ChangeNotifier {
  final ForumRepository _forumRepository;

  bool _isLoading = false;

  List<ComentarioResponseModel> _replies = [];

  CommentViewModel({
    required ForumRepository forumRepository,    required AuthRepository authRepository,
  }) : _authRepository = authRepository, _forumRepository = forumRepository{
    addCommentCommand = Command2(_addComment);
    currentUser = _authRepository.currentUser;
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      currentUser = user;
      notifyListeners();
    });
  }

  final AuthRepository _authRepository;

  UsuarioResponseModel? currentUser;

  StreamSubscription<UsuarioResponseModel?>? get authSubscription =>
      _authSubscription;
  StreamSubscription<UsuarioResponseModel?>? _authSubscription;

  bool get isLoading => _isLoading;

  List<ComentarioResponseModel> get replies => _replies;
  bool _showReplies = false;
  bool get showReplies => _showReplies;
  int _currentPage = 0;
  bool _hasMore = false;
  bool get hasMore => _hasMore;

  void toggleReplies() {
    _showReplies = !_showReplies;
    notifyListeners();
  }

  cleanReplies() {
    _currentPage = 0;
    _replies.clear();
    toggleReplies();
  }

  Future<void> fetchReplies({required int commentId,bool append = false}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    final result = await _forumRepository.findReplies(
      id: commentId,
      page: _currentPage,
      size: 5,
    );

    result.fold(
      (onSuccess) {
        if (append) {
          _replies.addAll(onSuccess.content);
        } else {
          _replies = onSuccess.content.toList();
        }

        _hasMore = !onSuccess.last;
        _currentPage++;
        _isLoading = false;
        notifyListeners();
      },
      (onError) {
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  late Command2<ComentarioResponseModel, int, ComentarioRequestModel>
  addCommentCommand;
  late Command2<ComentarioResponseModel, int, ComentarioRequestModel>
  updateCommentCommand;

  AsyncResult<ComentarioResponseModel> _addComment(
    int publicationID,
    ComentarioRequestModel request,
  ) async {
    final result = await _forumRepository.addComment(
      publicationId: publicationID,
      request: request,
    );
    return result.mapFold(
      (onSuccess) {
        _replies.insert(0, onSuccess);
        notifyListeners();
        return onSuccess;
      },
      (onFailure) {
        return Exception('Não foi possível adicionar seu comentario.');
      },
    );
  }

  AsyncResult<ComentarioResponseModel> _updateComment(
    int publicationID,
    ComentarioRequestModel request,
  ) async {
    final result = await _forumRepository.addComment(
      publicationId: publicationID,
      request: request,
    );
    return result.mapFold(
      (onSuccess) {
        _replies.insert(0, onSuccess);
        notifyListeners();
        return onSuccess;
      },
      (onFailure) {
        return Exception('Não foi possível adicionar seu comentario.');
      },
    );
  }
}
