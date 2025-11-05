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
  AsyncResult<PublicacaoDetalhadaModel> savePublication(
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
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> fetchFeedPublication({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
    String? query

  }) async {
    try {
      final responseMap = await _service.fetchFeedPublication(
        categorias: categorias,
        ordenarPor: ordenarPor,
        page: page,
        size: size, query: query
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
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> fetchPublicationsByUserID({
    required int id,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final responseMap = await _service.fetchPublicationsByUserID(
        id: id,
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
  AsyncResult<PublicacaoDetalhadaModel> findById(int id) async {
    try {
      final response = await _service.findPublicationById(id);
      return Success(PublicacaoDetalhadaModel.fromJson(response));
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao buscar publicação por ID.'));
    }
  }

  @override
  AsyncResult<PaginatedResponse<ComentarioResponseModel>> fetchComments({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await _service.findComments(
        id: id,
        ordenarPor: ordenarPor,
        page: page,
        size: size,
      );
      return Success(
        PaginatedResponse<ComentarioResponseModel>.fromJson(
          response,
          (json) =>
              ComentarioResponseModel.fromJson(json as Map<String, dynamic>),
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
  @override
  AsyncResult<void> deletePublication(int id) async {
    try {
      await _service.deletePublication(id);
      return Success(Null);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao excluir a publicação. $e'));
    }
  }

  @override
  AsyncResult<PublicacaoDetalhadaModel> updatePublication(
      int id,
      PublicacaoRequestModel request,
      ) async {
    try {
      final response = await _service.updatePublication(
        id: id,
        publicacaoRequest: request.toJson(),
      );

      return Success(PublicacaoDetalhadaModel.fromJson(response));
    } on DioException catch (e) {

      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao atualizar a publicação.'));
    }
  }
  @override
  AsyncResult<bool> toggleLikePublication(int publicationId)async {
    try {
      final response = await _service.toggleLikePublication(publicationId);
      return Success(response['liked']);
    } on DioException catch (e) {

      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao curtir a publicação.'));
    }
  }
  
  
  @override
  AsyncResult<ComentarioResponseModel> addComment({required int publicationId, required ComentarioRequestModel request}) async {
    try {
      final response = await _service.addComment(
        publicacaoId: publicationId,
        commentRequest: request.toJson(),
      );

      return Success(ComentarioResponseModel.fromJson(response));
    } on DioException catch (e) {

      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao atualizar a publicação.'));
    }
  }

  @override
  AsyncResult<PaginatedResponse<ComentarioResponseModel>> fetchReplies({required int id, Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE, int page = 0, int size = 10})async {
    try {
      final response = await _service.findReplies(
        id: id,
        ordenarPor: ordenarPor,
        page: page,
        size: size,
      );
      return Success(
        PaginatedResponse<ComentarioResponseModel>.fromJson(
          response,
              (json) =>
              ComentarioResponseModel.fromJson(json as Map<String, dynamic>),
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
        case 403:
          throw ForbiddenException(message: errorMessage);
        case 404:
          throw NotFoundException(message: errorMessage);
        case 409:
          throw ApiException(message: errorMessage, statusCode: statusCode);
        case 500:
          throw InternalServerException();
        default:
          throw ApiException(message: errorMessage, statusCode: statusCode);
      }
    }
    throw Exception(
      'Falha de conexão. Verifique sua internet e tente novamente. $e',
    );
  }

  @override
  AsyncResult<ComentarioResponseModel> updateComment({required int commentId, required ComentarioRequestModel request}) async {
    try {
      final response = await _service.updateComment(commentId: commentId, commentRequest: request.toJson());
      return Success(ComentarioResponseModel.fromJson(response));
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao atualizar a comentário.'));
    }
  }

  @override
  AsyncResult<void> deleteComment(int commentId) async {
    try {
      await _service.deleteComment(commentId);
      return Success(Null);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao excluir a comentário. $e'));
    }
  }

  @override
  AsyncResult<List<String>> searchSuggestions({Set<Categorias>? categorias, required String query}) async{
    try {
     final result = await _service.searchSuggestions(categorias: categorias,query: query);
     final list = List<String>.from(result);
     return Success(list);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado ao sugerir a titulos. $e'));
    }
  }



}
