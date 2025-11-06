import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/viewmodels/feed_viewmodel.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../domain/models/api/request/gen_requests.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';

class PublicacaoViewModel extends ChangeNotifier {
  PublicacaoViewModel({
    required ForumRepository forumRepository,
    required AuthRepository authRepository,
    required PublicationsViewModel publicationsViewModel,
  }) : _authRepository = authRepository,
       _forumRepository = forumRepository,
       _publicationsViewModel = publicationsViewModel {
    fetchMoreCmd = Command1(_fetchMore);
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
    addCommentsCommand = Command2(_addComment);
    deleteCommentsCommand = Command1(_deleteComment);
    deletePublicationCommand = Command1(_deletePublication);
  }
  final ForumRepository _forumRepository;
  final AuthRepository _authRepository;
  final PublicationsViewModel _publicationsViewModel;

  UsuarioResponseModel? currentUser;

  StreamSubscription<UsuarioResponseModel?>? get authSubscription =>
      _authSubscription;
  StreamSubscription<UsuarioResponseModel?>? _authSubscription;
  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  PublicacaoDetalhadaModel? _publication;
  PublicacaoDetalhadaModel? get publication => _publication;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  List<CommentNode> _comments = [];
  List<CommentNode> get comments => _comments;

  late final Command1<PublicacaoDetalhadaModel, int> fetchPublicationCommand;
  late final Command2<List<ComentarioResponseModel>, int, Ordenacao>
  fetchRespostasCommand;

  late final Command2<ComentarioResponseModel, int, ComentarioRequestModel>
  addCommentsCommand;
  late final Command1<bool, int> deleteCommentsCommand;
  late final Command1<bool, int> deletePublicationCommand;



  double scrollOffset = 0.0;

  ComentarioResponseModel? _respostaEscolhida;
  ComentarioResponseModel? get respostaEscolhida => _respostaEscolhida;

  AsyncResult<bool> _deletePublication(int id) async {
    final result = await _forumRepository.deletePublication(id);
    return result.mapFold((onSuccess) {
      if (_publication != null) {
        _publicationsViewModel.delete(publicationId: _publication!.id);
        _publication = null;
        notifyListeners();
      }
      return true;
    }, (onFailure) => onFailure);
  }

  toggleLikePublication(int id) async {
    final response = await _forumRepository.toggleLikePublication(id);
    response.fold((onSuccess) {
      if (_publication != null) {
        _publication = _publication!.copyWith(
          curtidoPeloUsuario: onSuccess,
          totalLikes:
              onSuccess
                  ? _publication!.totalLikes + 1
                  : _publication!.totalLikes - 1,
        );
        _publicationsViewModel.update(
          publicationId: _publication!.id,
          publication: _publication!,
        );
        notifyListeners();
      }
    }, (onFailure) {});
  }

  AsyncResult<void> deleteResposta(int id) async {
    final result = await _forumRepository.deletePublication(id);
    return result.mapFold(
      (onSuccess) {
        _comments = _comments.toList();
        _comments.removeWhere((r) => r.comment.id == id);
        if (_publication != null) {
          _publication = _publication!.copyWith(
            totalRespostas: _publication!.totalRespostas - 1,
          );
          _publicationsViewModel.update(
            publicationId: _publication!.id,
            publication: _publication!,
          );
        }

        notifyListeners();
        return Null;
      },
      (onFailure) {
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
        _publicationsViewModel.add(publication: onSuccess);
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
  Ordenacao _order = Ordenacao.RELEVANCIA;

  AsyncResult<List<ComentarioResponseModel>> _fetchRespostas(
    int id,
    Ordenacao order,
  ) async {
    _order = order;
    final result = await _forumRepository.fetchComments(
      id: id,
      ordenarPor: order,
      page: 0,
      size: 10,
    );
    return result.mapFold(
      (onSuccess) {
        _comments.addAll(
          onSuccess.content
              .map(
                (comment) => CommentNode(
                  addCommand: Command2(_addComment),
                  updateCommand: Command2(_updateComment),
                  comment: comment,
                ),
              )
              .toList(),
        );

        if (_publication?.respostaEscolhidaId != null) {
          final index = _comments.indexWhere(
            (test) => test.comment.id == _publication!.respostaEscolhidaId!,
          );
          if (index != -1) {
            _respostaEscolhida = _comments[index].comment;
          }
        }
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
  int _pageComment =0;

  late final Command1<List<ComentarioResponseModel>, int> fetchMoreCmd;

  AsyncResult<List<ComentarioResponseModel>> _fetchMore(
    int id,
  ) async {
    _pageComment++;
    final result = await _forumRepository.fetchComments(
      id: id,
      ordenarPor: _order,
      page: _pageComment,
      size: 10,
    );
    return result.mapFold(
      (onSuccess) {
        _comments.addAll(
          onSuccess.content
              .map(
                (comment) => CommentNode(
                  addCommand: Command2(_addComment),
                  updateCommand: Command2(_updateComment),
                  comment: comment,
                ),
              )
              .toList(),
        );

        if (_publication?.respostaEscolhidaId != null) {
          final index = _comments.indexWhere(
            (test) => test.comment.id == _publication!.respostaEscolhidaId!,
          );
          if (index != -1) {
            _respostaEscolhida = _comments[index].comment;
          }
        }
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

  Future<void> fetchReplies({
    required int commentId,
    bool append = false,
  }) async {
    final commentNode = _comments.firstWhere(
      (comment) => comment.comment.id == commentId,
    );

    if (commentNode.isLoading) return;
    commentNode.isLoading = true;
    notifyListeners();
    final result = await _forumRepository.fetchReplies(
      id: commentId,
      page: commentNode.currentPage,
      size: 5,
    );
    result.fold(
      (onSuccess) {
        if (append) {
          final existingIds =
              commentNode.replies.map((r) => r.comment.id).toSet();
          final newReplies =
              onSuccess.content
                  .where((c) => !existingIds.contains(c.id))
                  .map(
                    (comment) => CommentNode(
                      addCommand: Command2(_addComment),
                      updateCommand: Command2(_updateComment),
                      comment: comment,
                    ),
                  )
                  .toList();

          commentNode.replies.addAll(newReplies);
        } else {
          commentNode.replies =
              onSuccess.content
                  .map(
                    (comment) => CommentNode(
                      addCommand: Command2(_addComment),
                      updateCommand: Command2(_updateComment),
                      comment: comment,
                    ),
                  )
                  .toList();
        }
        commentNode.hasMore = !onSuccess.last;
        commentNode.currentPage++;
        commentNode.isLoading = false;
        notifyListeners();
      },
      (onError) {
        commentNode.isLoading = false;
        notifyListeners();
      },
    );
  }

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
        if (onSuccess.parentId != null) {
          final comment = _comments.firstWhere(
            (commentNode) => commentNode.comment.id == onSuccess.parentId,
          );
          comment.replies.add(
            CommentNode(
              addCommand: Command2(_addComment),
              updateCommand: Command2(_updateComment),
              comment: onSuccess,
            ),
          );
          comment.comment = comment.comment.copyWith(
            totalRespostas: comment.comment.totalRespostas + 1,
          );
          comment.showReplies = true;
          comment.hasMore =
              (comment.replies.length != comment.comment.totalRespostas);
        } else {
          _comments.insert(
            0,
            CommentNode(
              addCommand: Command2(_addComment),
              updateCommand: Command2(_updateComment),
              comment: onSuccess,
            ),
          );
          if (_publication != null) {
            _publication = _publication!.copyWith(
              totalRespostas: _publication!.totalRespostas + 1,
            );
            _publicationsViewModel.update(
              publicationId: _publication!.id,
              publication: _publication!,
            );
          }
        }

        notifyListeners();
        return onSuccess;
      },
      (onFailure) {
        return Exception('Não foi possível adicionar seu comentario.');
      },
    );
  }

  AsyncResult<ComentarioResponseModel> _updateComment(
    int commentId,
    ComentarioRequestModel request,
  ) async {
    final result = await _forumRepository.updateComment(
      commentId: commentId,
      request: request,
    );
    return result.mapFold(
      (onSuccess) {
        final updatedComment = onSuccess;
        if (updatedComment.parentId != null) {
          final commentNode = _comments.firstWhere(
            (commentNode) => commentNode.comment.id == updatedComment.parentId,
          );
          final int index = commentNode.replies.indexWhere(
            (commentNode) => commentNode.comment.id == updatedComment.id,
          );

          if (index != -1) {
            commentNode.replies[index].comment = onSuccess;
          }
        } else {
          final int index = _comments.indexWhere(
            (commentNode) => commentNode.comment.id == updatedComment.id,
          );
          _comments[index].comment = onSuccess;
        }
        notifyListeners();
        return onSuccess;
      },
      (onFailure) {
        return Exception('Não foi possível atualizar seu comentario.');
      },
    );
  }

  AsyncResult<bool> _deleteComment(int commentId) async {
    final result = await _forumRepository.deleteComment(commentId);
    return result.mapFold(
      (onSuccess) {
        final comment = findCommentById(commentId);
        final isRemoved = removeById(commentId);
        if (comment != null && comment.comment.parentId != null) {
          final parentIndex = _comments.indexWhere(
            (c) => c.comment.id == comment.comment.parentId,
          );
          if (parentIndex != -1) {
            final parent = _comments[parentIndex];
            parent.comment = parent.comment.copyWith(
              totalRespostas:
                  (parent.comment.totalRespostas - 1)
                      .clamp(0, double.infinity)
                      .toInt(),
            );
            parent.showReplies = parent.comment.totalRespostas > 0;
          }
        }


        notifyListeners();
        return isRemoved;
      },
      (onFailure) {
        return onFailure;
      },
    );
  }

  CommentNode? findCommentById(int id) {
    for (final parentNode in _comments) {
      if (parentNode.comment.id == id) {
        return parentNode; // Encontrado!
      }
      for (final replyNode in parentNode.replies) {
        if (replyNode.comment.id == id) {
          return replyNode;
        }
      }
    }
    return null;
  }

  bool removeById(int id) {
    bool removeAtIndex(int index, List<CommentNode> list) {
      if (index != -1) {
        list.removeAt(index);
        return true;
      }
      return false;
    }

    int index = _comments.indexWhere((c) => c.comment.id == id);
    if (removeAtIndex(index, _comments)) {
      if (_publication != null) {
        _publication = _publication!.copyWith(
          totalRespostas: _publication!.totalRespostas - 1,
        );
        _publicationsViewModel.update(
          publicationId: _publication!.id,
          publication: _publication!,
        );
      }

      return true;
    }

    for (final parent in _comments) {
      int replyIndex = parent.replies.indexWhere((c) => c.comment.id == id);
      if (removeAtIndex(replyIndex, parent.replies)) return true;
    }

    return false;
  }

  Future<void> toggleReplies(int id) async {
    final commentNode = findCommentById(id);
    if (commentNode == null) return;

    if (commentNode.showReplies) {
      commentNode.showReplies = false;
      commentNode.replies = [];
      commentNode.currentPage = 0;
    } else {
      await fetchReplies(commentId: id);
      commentNode.showReplies = true;
    }
    notifyListeners();
  }
}

class CommentNode {
  ComentarioResponseModel comment;

  List<CommentNode> replies;

  bool isLoading;
  bool showReplies;
  bool hasMore;
  int currentPage;

  final Command2<ComentarioResponseModel, int, ComentarioRequestModel>
  addCommand;
  final Command2<ComentarioResponseModel, int, ComentarioRequestModel>
  updateCommand;

  CommentNode({
    required this.addCommand,
    required this.updateCommand,
    required this.comment,
    List<CommentNode>? replies,
    this.isLoading = false,
    this.showReplies = false,
    this.hasMore = false,
    this.currentPage = 0,
  }) : replies = List<CommentNode>.from(replies ?? []);
}
