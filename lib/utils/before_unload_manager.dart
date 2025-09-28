import 'dart:js_interop';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web/web.dart' as web;

class BeforeUnloadManager {
  void Function(web.Event)? _listener;

  void enable([String message = "Você tem tarefas pendentes, deseja mesmo sair?"]) {
    if (!kIsWeb) return;
    if (_listener != null) return;

    _listener = (web.Event event) {
      final e = event as web.BeforeUnloadEvent;
      e.preventDefault();
      e.returnValue = message;
    };

    // CORREÇÃO AQUI
    web.window.addEventListener('beforeunload', _listener!.toJS);
  }

  void disable() {
    if (!kIsWeb) return;
    if (_listener != null) {
      // E CORREÇÃO AQUI
      web.window.removeEventListener('beforeunload', _listener!.toJS);
      _listener = null;
    }
  }
}