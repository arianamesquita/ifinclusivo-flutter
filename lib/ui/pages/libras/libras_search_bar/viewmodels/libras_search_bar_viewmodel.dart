import 'package:flutter/cupertino.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';

enum LibrasSearchBarState {
  idle,
  loading,
  loadingMore,
  error,
}

class LibrasSearchBarViewmodel extends ChangeNotifier{
  LibrasSearchBarViewmodel({required LibrasRepository librasRepository}) : _librasRepository = librasRepository;
  final LibrasRepository _librasRepository;

  LibrasSearchBarState _state = LibrasSearchBarState.loading;
  String _errorMessage = '';

  LibrasSearchBarState get state => _state;
  String get errorMessage => _errorMessage;

  List<LibrasResponseModel> _words = [];
  List<LibrasResponseModel> get words => _words;

  fetchLibrasByWord(String word) async {
    if(_state != LibrasSearchBarState.loading){
      _state = LibrasSearchBarState.loading;
    }

    try{
      final response = await _librasRepository.getLibrasByWord(palavra: word);
      _words = response.content;
      _state = LibrasSearchBarState.idle;
    } catch(e) {
      _state = LibrasSearchBarState.error;
      _errorMessage = e.toString();
    }
  }
}