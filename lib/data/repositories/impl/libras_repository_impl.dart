import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/data/services/libras_service.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/domain/models/gen_models.dart';
import 'package:if_inclusivo/exceptions/api_exception.dart';

class LibrasRepositoryImpl implements LibrasRepository{
  final LibrasService _librasService;

  LibrasRepositoryImpl({required LibrasService librasService}) : _librasService = librasService;

  @override
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias}) async {
    try{
      final data = await _librasService.getLibrasByTopic(pages: pages, size: size, categorias: categorias);
      return PaginatedResponse.fromJson(data, (json)=> LibrasResponseModel.fromJson(json as Map<String, dynamic>));
    } on DioException catch (e) {
      if(e.response != null) {
        final statusCode = e.response!.statusCode;
        final response = e.response!.data;
        String errorMessage = 'erro inesperado';

        if(response is Map && response.containsKey('message')) {
          errorMessage = response['message'];
        }

        switch(statusCode) {
          case 409: throw ApiException(message: errorMessage, statusCode: statusCode);
          case 500: throw InternalServerException();
        }
      }

      throw Exception('falha de conexão, verifique sua internet e tente mais tarde. dentro $e');
    } catch(e) {
      throw Exception('falha de conexão, verifique sua internet e tente mais tarde. fora $e');
    }
  }
}