import 'dart:async';
import 'package:flutter/material.dart';

/// Uma classe que converte um [Stream] em um [Listenable].
/// O GoRouter pode usar isso para reagir a mudanças no estado de autenticação.
class StreamListenable extends ChangeNotifier {
  late final StreamSubscription _subscription;

  StreamListenable(Stream<dynamic> stream) {
    _subscription = stream.listen(
          (_) => notifyListeners(),
    );
  }


  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}