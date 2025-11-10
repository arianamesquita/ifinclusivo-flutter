import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/services/libras_service.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';

class LibrasServiceImpl implements LibrasService{
  final Dio _dio;
  final String basePath = '/sinais';

  LibrasServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Map<String, dynamic>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias}) async {
    final queryParams = <String, dynamic>{};

    if(categorias != null){
      queryParams['categoria'] = categorias.name;
    }

    queryParams['pages'] = pages;
    queryParams['size'] = size;
    queryParams['sortBy'] = 'id';
    queryParams['sortDir'] = 'asc';

    final response = await _dio.get('$basePath/busca-categoria', queryParameters: queryParams);

    return response.data;
  }

  @override
  Future<Map<String, dynamic>>  getLibrasByWord({String? palavra, int pages = 0, int size = 10, String sort = 'asc'}) async {
    final queryParams = <String, dynamic>{};

    if(palavra!.isNotEmpty && palavra != null){
      queryParams['palavra'] = palavra.toLowerCase();
    }

    queryParams['pages'] = pages;
    queryParams['size'] = size;
    queryParams['sortDir'] = 'asc';

    final response = await _dio.get('$basePath/busca-palavras', queryParameters: queryParams);
    print(response.data);

    return response.data;

  }

  @override
  Future<Map<String, dynamic>> getLibrasById({required int id}) async {
    final response = await _dio.get('$basePath/find/$id');
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> saveWord(FormData formData) async {
    final result = await _dio.post(
      '$basePath/sugere',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return result.data;
  }
  @override
  Future<List<dynamic>> searchSuggestions({
    required String query,
  }) async {
    final queryParameters = <String, dynamic>{'palavra': query};
    
    final response = await _dio.get('$basePath/busca-profunda',queryParameters: queryParameters);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> fetchRelatedById({int page = 0, int size = 5, required int id}) async{
    final queryParameters = <String, dynamic>{'page': page, 'size': size};
    final response = await _dio.get('$basePath/relacionadas/$id', queryParameters: queryParameters);
    return response.data;
  }
}