import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:if_inclusivo/data/services/forum_service.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/models/enums/categorias.dart';
import '../../../domain/models/gen_models.dart';
import '../../../exceptions/api_exception.dart';

class ForumRepositoryImpl implements ForumRepository {
  final ForumService _service;

  ForumRepositoryImpl({required ForumService service}) : _service = service;

  @override
  AsyncResult<PublicacaoDetalhadaModel> create(
    PublicacaoRequestModel request,
  ) async {
    try {
      final response = await _service.createPublication(request.toJson());
      final publication = PublicacaoDetalhadaModel.fromJson(response);
      return Success(publication);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Falha ao processar a resposta do servidor.'));
    }
  }

  @override
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> findAll({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final responseMap = await _service.findAll(
        categorias: categorias,
        ordenarPor: ordenarPor,
        page: page,
        size: size,
      );

      return Success(
        PaginatedResponse<PublicacaoDetalhadaModel>.fromJson(
          responseMap,
          (json) =>
              PublicacaoDetalhadaModel.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Falha ao processar a resposta do servidor.'));
    }
  }

  @override
  AsyncResult<PublicacaoCompletaModel> findById(int id) async {
    try {
      final response = await _service.findById(id);
      return Success(PublicacaoCompletaModel.fromJson(response));
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao buscar publicação por ID.'));
    }
  }

  @override
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> findRespostas({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await _service.findRespostas(
        id: id,
        ordenarPor: ordenarPor,
        page: page,
        size: size,
      );
      return Success(
        PaginatedResponse<PublicacaoDetalhadaModel>.fromJson(
          response,
          (json) =>
              PublicacaoDetalhadaModel.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(
        Exception('Erro inesperado ao buscar respostas da publicação.'),
      );
    }
  }

  // 🔹 Handler para exceções centralizado
  Never _handleDioError(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final responseData = e.response!.data;
      String errorMessage = "Ocorreu um erro inesperado.";
      if (responseData is Map && responseData.containsKey('message')) {
        errorMessage = responseData['message'];
      }
      switch (statusCode) {
        case 400:
          throw BadRequestException(
            message: errorMessage,
            errors: responseData,
          );
        case 401:
          throw UnauthorizedException(message: errorMessage);
        default:
          throw ApiException(message: errorMessage, statusCode: statusCode);
      }
    }
    throw Exception(
      'Falha de conexão. Verifique sua internet e tente novamente.',
    );
  }
}
