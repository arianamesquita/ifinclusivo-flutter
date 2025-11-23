import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';

enum SpecificTopicsState {
  idle,
  loading,
  loadingMore,
  error,
}

class SpecificTopicViewModel extends ChangeNotifier {
  SpecificTopicViewModel({required LibrasRepository librasRepository})
      : _librasRepository = librasRepository;

  final LibrasRepository _librasRepository;

  SpecificTopicsState _state = SpecificTopicsState.loading;
  String _errorMessage = '';

  SpecificTopicsState get state => _state;
  String get errorMessage => _errorMessage;

  late Categorias _category;
  Categorias get category => _category;

  int _currentPage = 0;
  int _totalPages = 1; // valor inicial padrão

  final List<LibrasResponseModel> _models = [];
  List<LibrasResponseModel> get models => List.unmodifiable(_models);

  /// Busca inicial de dados
  Future<void> fetchLibras(Categorias category) async {
    _category = category;
    _currentPage = 0;
    _models.clear();
    _state = SpecificTopicsState.loading;
    notifyListeners();

    try {
      final response = await _librasRepository.getLibrasByTopic(
        categorias: category,
        pages: _currentPage,
      );

      _models.addAll(response.content);
      _totalPages = response.totalPages;
      _state = SpecificTopicsState.idle;
    } catch (e) {
      _state = SpecificTopicsState.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_state == SpecificTopicsState.loadingMore ||
        _currentPage + 1 >= _totalPages) return;

    _state = SpecificTopicsState.loadingMore;
    notifyListeners();

    try {
      _currentPage++;
      final response = await _librasRepository.getLibrasByTopic(
        categorias: _category,
        pages: _currentPage,
      );

      _models.addAll(response.content);
      _totalPages = response.totalPages;
      _state = SpecificTopicsState.idle;
    } catch (e) {
      _state = SpecificTopicsState.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  bool get hasMore => _currentPage + 1 < _totalPages;
}
