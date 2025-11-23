import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:dio/dio.dart';

abstract class LibrasService {
  Future<Map<String, dynamic>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias,});
  Future<Map<String, dynamic>> saveWord(FormData formData);


  Future<Map<String, dynamic>> getLibrasById({required int id});

  Future<Map<String, dynamic>>  getLibrasByWord({String? palavra, int pages = 0, int size = 10, String sort = 'asc' });
  Future<List<dynamic>> searchSuggestions({required String query});
  Future<Map<String, dynamic>> fetchRelatedById({
    int page = 0,
    int size = 5,
   required int id
  });
}