import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/services/forum_service.dart';

import '../../../domain/models/enums/categorias.dart';

class ForumServiceImpl implements ForumService {
  final Dio _dio;

  ForumServiceImpl({required Dio dio}) : _dio = dio;
  final basePath = '/publicacoes';

  @override
  Future<Map<String, dynamic>> createPublication(
    Map<String, dynamic> publicacaoRequest,
  ) async {
    final response = await _dio.post(basePath, data: publicacaoRequest);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> findAll({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  }) async {
    final queryParameters = <String, dynamic>{'page': page, 'size': size};

    if (ordenarPor != null) {
      queryParameters['ordenarPor'] = ordenarPor.name;
    }

    if (categorias != null && categorias.isNotEmpty) {
      queryParameters['categorias'] = categorias.map((e) => e.name).toList();
    }
    print(queryParameters);

    final response = await _dio.get(basePath, queryParameters: queryParameters);

    return response.data;
  }

  /// Busca uma publicação por ID (com árvore de pais, sem filhos)
  @override
  Future<Map<String, dynamic>> findById(int id) async {
    final response = await _dio.get('$basePath/$id');
    return response.data;
  }

  /// Lista as respostas (filhos) de uma publicação
  @override
  Future<Map<String, dynamic>> findComments({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  }) async {
    final queryParameters = {
      'ordenarPor': ordenarPor.name,
      'page': page,
      'size': size,
    };

    final response = await _dio.get(
      '/comentarios/publicacao/$id',
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<void> deletePublication(int id) async {
    await _dio.delete('$basePath/$id');
  }

  @override
  Future<Map<String, dynamic>> updatePublication({
    required int id,
    required Map<String, dynamic> publicacaoRequest,
  }) async {
    final response = await _dio.put('$basePath/$id', data: publicacaoRequest);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> findReplies({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  }) async {
    final queryParameters = {
      'ordenarPor': ordenarPor.name,
      'page': page,
      'size': size,
    };

    final response = await _dio.get(
      '/comentarios/respostas/$id',
      queryParameters: queryParameters,
    );

    return response.data;
  }

  @override
  Future<Map<String, dynamic>> addComment({
    required int publicacaoId,
    required Map<String, dynamic> commentRequest,
  }) async {
    final response = await _dio.post(
      '/comentarios/publicacao/$publicacaoId',
      data: commentRequest,
    );

    return response.data;
  }
}
