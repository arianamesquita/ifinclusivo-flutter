import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';

Document loadDocument({required String? text}) {
  try {
    final List<dynamic> jsonData = jsonDecode(text!);
    return Document.fromJson(jsonData);
  } catch (e) {
    return Document()..insert(0, 'Erro ao carregar conteúdo.');
  }
}