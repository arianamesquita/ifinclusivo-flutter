import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../data/repositories/forum_repository.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';

enum FeedState { initialLoading, loadingMore, content, error, empty }

class FeedViewModel extends ChangeNotifier {
  FeedViewModel({
    required ForumRepository forumRepository,
    required AuthRepository authRepository,
  }) : _forumRepository = forumRepository,
       _authRepository = authRepository {
    currentUser = _authRepository.currentUser;
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      currentUser = user;
      notifyListeners();
    });
    deleteCommentsCommand = Command1(_deletePublication);
  }

  final ForumRepository _forumRepository;
  final AuthRepository _authRepository;

  UsuarioResponseModel? currentUser;

  StreamSubscription<UsuarioResponseModel?>? _authSubscription;

  FeedState _state = FeedState.initialLoading;
  FeedState get state => _state;

  String? errorMessage;

  final List<PublicacaoDetalhadaModel> publications = [];
  int _currentPage = 0;
  bool _hasMorePages = true;

  Set<Categorias> _currentCategories = {};
  Ordenacao _currentOrder = Ordenacao.RELEVANCIA;

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  Future<void> fetchPublications({
    Set<Categorias>? categories,
    Ordenacao? order,
  }) async {
    if (categories != null || order != null) {
      _currentCategories = categories ?? {};
      _currentOrder = order ?? Ordenacao.MAIS_RECENTE;
      _currentPage = 0;
      publications.clear();
      _hasMorePages = true;
    }

    _state = FeedState.initialLoading;
    notifyListeners();

    final response = await _forumRepository.fetchFeedPublication(
      categorias: _currentCategories,
      ordenarPor: _currentOrder,
      page: 0,
    );

    response.fold(
      (onSuccess) {
        publications.addAll(onSuccess.content);
        _hasMorePages = !onSuccess.last; // agora funciona
        _currentPage = 1;

        if (publications.isEmpty) {
          _state = FeedState.empty;
        } else {
          _state = FeedState.content;
        }
      },
      (onFailure) {
        errorMessage = onFailure.toString();
        _state = FeedState.error;
      },
    );

    notifyListeners();
  }

  Future<void> fetchMorePublications() async {
    if (_state == FeedState.loadingMore || !_hasMorePages) {
      return;
    }

    _state = FeedState.loadingMore;
    notifyListeners();

    final response = await _forumRepository.fetchFeedPublication(
      categorias: _currentCategories,
      ordenarPor: _currentOrder,
      page: _currentPage,
    );

    response.fold(
      (onSuccess) {
        publications.addAll(onSuccess.content);
        _hasMorePages = !onSuccess.last;
        _currentPage++;
        _state = FeedState.content;
        notifyListeners();
      },
      (onFailure) {
        print("Erro ao buscar mais publicações: $onFailure");
        _state = FeedState.content;
        notifyListeners();
      },
    );
  }
  late final Command1<bool, int> deleteCommentsCommand;

  AsyncResult<bool> _deletePublication(int id) async {
    final result = await _forumRepository.deletePublication(id);

   return result.mapFold((onSuccess){
     int index=  publications.indexWhere((p)=> p.id == id);
     if(index != -1){
       publications.removeAt(index);
       notifyListeners();
     }
     return true;
   }, (onFailure){
     return onFailure;
   });

  }

  Future<void> updatePubication(int id) async {
    final result = await _forumRepository.findById(id);

    result.fold(
            (onSuccess){
          int index=  publications.indexWhere((p)=> p.id == id);
          if(index != -1){
            publications[index] = onSuccess;
            notifyListeners();
          }
        },
            (onFailure){});
  }
  }

