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

class SpecificTopicViewModel extends ChangeNotifier{
  SpecificTopicViewModel({required LibrasRepository librasRepository}) : _librasRepository = librasRepository;
  final LibrasRepository _librasRepository;


  SpecificTopicsState _state = SpecificTopicsState.loading;
  String _errorMessage = '';


  SpecificTopicsState get state => _state;
  String get errorMessage => _errorMessage;

  int _currentPage = 0;

  late Categorias _category;

  List<LibrasResponseModel> _models = [];

  List<LibrasResponseModel> get models => _models;

  fetchLibras(Categorias category) async {
    if(_state != SpecificTopicsState.loading) {
      _state = SpecificTopicsState.loading;
    }
    _models = [];
    _currentPage = 0;
    _category = category;
    notifyListeners();

    try{
      final response = await _librasRepository.getLibrasByTopic(categorias: category, pages: _currentPage);
      _models = response.content;
      _state = SpecificTopicsState.idle;
    } catch (e) {
      _state = SpecificTopicsState.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}