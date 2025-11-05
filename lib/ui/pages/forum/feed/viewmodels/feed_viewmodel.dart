import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/auth_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../data/repositories/forum_repository.dart';
import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';

enum FeedState { initialLoading, loadingMore, content, error, empty }

abstract class PublicationsViewModel {
  void add({required PublicacaoDetalhadaModel publication});
  void update({
    required int publicationId,
    required PublicacaoDetalhadaModel publication,
  });
  void delete({required int publicationId});
}

class FeedViewModel extends ChangeNotifier implements PublicationsViewModel {
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
  String? _query;

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;

  Future<void> searchSuggestions({
    required String query,
    Set<Categorias>? categorias,
  }) async {
    final result = await _forumRepository.searchSuggestions(
      query: query,
      categorias: categorias,
    );
    result.fold(
      (onSuccess) {
        _suggestions = onSuccess;
      },
      (onFailure) {
        _suggestions = [];
      },
    );

    notifyListeners();
  }

  Future<void> fetchPublications({
    Set<Categorias>? categories,
    Ordenacao? order,
    String? query
  }) async {
    if (categories != null || order != null|| query != null) {
      if (categories != null) _currentCategories = categories;
      if (order != null) _currentOrder = order;
      // Se vier vazia, considera sem query ativa
      if (query != null) {
        _query = query.isEmpty ? null : query;
      }
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
      query: _query
    );

    response.fold(
      (onSuccess) {
        final existingIds = publications.map((p) => p.id).toSet();
        final newPublications = onSuccess.content
            .where((p) => !existingIds.contains(p.id))
            .toList();


        publications.addAll(newPublications.toList());
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
      query: _query
    );

    response.fold(
      (onSuccess) {
        final existingIds = publications.map((p) => p.id).toSet();
        final newPublications = onSuccess.content
            .where((p) => !existingIds.contains(p.id))
            .toList();
        publications.addAll(newPublications);
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

    return result.mapFold(
      (onSuccess) {
        int index = publications.indexWhere((p) => p.id == id);
        if (index != -1) {
          publications.removeAt(index);
          notifyListeners();
        }
        return true;
      },
      (onFailure) {
        print(onFailure);
        return onFailure;
      },
    );
  }

  toggleLikePublication(int id) async {
    final response = await _forumRepository.toggleLikePublication(id);
    response.fold((onSuccess) {
      final index = publications.indexWhere((p) => p.id == id);
      if (index != -1) {
        publications[index] = publications[index].copyWith(
          curtidoPeloUsuario: onSuccess,
        );
        notifyListeners();
      }
    }, (onFailure) {});
  }

  Future<void> updatePubication(int id) async {
    final result = await _forumRepository.findById(id);

    result.fold((onSuccess) {
      int index = publications.indexWhere((p) => p.id == id);
      if (index != -1) {
        publications[index] = onSuccess;
        notifyListeners();
      }
    }, (onFailure) {});
  }

  @override
  void add({required PublicacaoDetalhadaModel publication}) {
    final exists = publications.any((p) => p.id == publication.id);
    if (exists) return;

    publications.insert(0, publication);
    notifyListeners();
  }

  @override
  void delete({required int publicationId}) {
    final index = publications.indexWhere((p) => p.id == publicationId);
    if (index == -1) return;

    publications.removeAt(index);
    notifyListeners();
  }

  @override
  void update({
    required int publicationId,
    required PublicacaoDetalhadaModel publication,
  }) {
    final index = publications.indexWhere((p) => p.id == publicationId);
    if (index == -1) return;
    publications[index] = publication;
    notifyListeners();
  }
}
