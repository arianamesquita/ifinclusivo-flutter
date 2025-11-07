import 'package:flutter/cupertino.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';

enum LibrasSearchBarState {
  idle,
  loading,
  loadingMore,
  error,
}

class LibrasSearchBarViewmodel with ChangeNotifier{
  LibrasSearchBarViewmodel({required LibrasRepository librasRepository}) : _librasRepository = librasRepository;
  final LibrasRepository _librasRepository;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  LibrasSearchBarState _state = LibrasSearchBarState.loading;
  LibrasSearchBarState get state => _state;

  List<LibrasResponseModel> _words = [];
  List<LibrasResponseModel> get words => _words;

  String _currentSearchTerm = '';
  String get currentSearchTerm => _currentSearchTerm;

  bool get isSearchActive => _currentSearchTerm.isNotEmpty;

  fetchLibrasByWord(String word) async {
    if (word.isEmpty) {
      _words = [];
      _currentSearchTerm = '';
      _state = LibrasSearchBarState.idle;
      notifyListeners();
      return;
    }

    _currentSearchTerm = word;
    _state = LibrasSearchBarState.loading;
    notifyListeners();

    try {
      final response = await _librasRepository.getLibrasByWord(palavra: word);
      _words = response.content;
      _state = LibrasSearchBarState.idle;
    } catch (e) {
      _words = [];
      _state = LibrasSearchBarState.error;
      _errorMessage = e.toString();
    }

    notifyListeners();
  }


  List<String> _suggestions = [];
  List<String> get suggestions => _suggestions;
  bool loadingSugestion = false;

  Future<void> searchSuggestions({
    required String query,
  }) async {
    if(query.trim().isEmpty) return;
    loadingSugestion = true;
    notifyListeners();
    final result = await _librasRepository.searchSuggestions(
      query: query,
    );
    result.fold(
          (onSuccess) {
        _suggestions = onSuccess;
      },
          (onFailure) {
            print(onFailure);
        _suggestions = [];
      },
    );
    loadingSugestion = false;
    notifyListeners();
  }
}