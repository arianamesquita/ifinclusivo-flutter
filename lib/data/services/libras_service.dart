import 'package:if_inclusivo/domain/models/enums/categorias.dart';

abstract class LibrasService {
  Future<Map<String, dynamic>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias,});
  Future<Map<String, dynamic>> saveWord(Map<String, dynamic> model);
}