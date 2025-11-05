import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lucid_validation/lucid_validation.dart';

class WordSuggestion extends ChangeNotifier {
  String word;
  String reason;
  String? link;

  WordSuggestion({
    required this.word,
    required this.reason,
    this.link,
  });

  factory WordSuggestion.empty() => WordSuggestion(word: '', reason: '', link: null);

  setWord(String word){
    this.word = word;
    notifyListeners();
  }

  setReason(String reason){
    this.reason = reason;
    notifyListeners();
  }

  setLink(String link){
    this.link = link;
    notifyListeners();
  }
}

class WordSuggestionValidator extends LucidValidator<WordSuggestion>{
  WordSuggestionValidator() {
    ruleFor((model) => model.word, key: 'word')
        .notEmpty(message: 'Este campo não pode ser vazio.')
        .minLength(3, message: 'A palavra deve ter no mínimo 3 caracteres.');
    ruleFor((model) => model.reason, key: 'reason')
        .notEmpty(message: 'É necessário ter uma justificativa')
        .minLength(50, message: 'A justificativa deve ter no mínimo 50 caracteres.')
        .maxLength(800, message: 'A justificativa ultrapassa o limite de 800 caracteres');
  }
}