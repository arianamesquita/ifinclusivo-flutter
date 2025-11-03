import 'package:if_inclusivo/domain/models/enums/categorias.dart';

abstract class LibrasService {
  Future<Map<String, dynamic>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias,});

  Future<String> getLibrasByWord({String? palavra, int pages = 0, int size = 10, String sort = 'asc' });
}