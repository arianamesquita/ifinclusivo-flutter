import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/services/forum_service.dart';

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
}
