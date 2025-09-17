
import 'package:flutter/cupertino.dart';

import '../../../exceptions/api_exception.dart';

enum ViewState{
  idle,
  loading,
  success,
  error
}
abstract class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  ApiException? _apiException;
  ApiException? get apiException => _apiException;

  void _setState(ViewState newState){
    _state = newState;
    notifyListeners();
  }

  /// Método "Guard" que encapsula a lógica de execução assíncrona.
  /// Ele gerencia automaticamente os estados de loading, success e error.
  ///
  /// [action]: A função assíncrona (ex: chamada de repositório) a ser executada.
  /// Retorna o resultado da função em caso de sucesso, ou `null` em caso de falha.
  Future<T?> executeAction<T>(Future<T> Function() action) async {
    _apiException = null;
    _setState(ViewState.loading);

    try {
      final result = await action();
      _setState(ViewState.success);
      return result;
    } on ApiException catch (e) {
      _apiException = e;
      _setState(ViewState.error);
      return null;
    } catch (e) {
      _apiException = ApiException(message: "Um erro inesperado ocorreu: $e");
      _setState(ViewState.error);
      return null;
    }
  }
}