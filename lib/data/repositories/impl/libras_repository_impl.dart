import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:if_inclusivo/data/services/libras_service.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/domain/models/gen_models.dart';
import 'package:if_inclusivo/exceptions/api_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';

class LibrasRepositoryImpl implements LibrasRepository{
  final LibrasService _librasService;

  LibrasRepositoryImpl({required LibrasService librasService}) : _librasService = librasService;

  @override
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByTopic({int pages = 2, int size = 10, Categorias? categorias}) async {
   try{
      final data = await _librasService.getLibrasByTopic(pages: pages, size: size, categorias: categorias);
      var response = PaginatedResponse.fromJson(data, (json)=> LibrasResponseModel.fromJson(json as Map<String, dynamic>));
      return response;
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

  @override
  AsyncResult<LibrasResponseModel> saveWord(LibrasRequestModel model) async {
    try {
      final result = await _librasService.saveWord(model.toJson());
      return Success(LibrasResponseModel.fromJson(result));
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(
        Exception('Erro inesperado ao enviar palavra: $e'), //retirar e
      );
    }
  }

  // ajustar para as rotas possíveis de erro em libras e verificar mensagens de erro retornadas
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
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByWord({String? palavra, int pages = 0, int size = 10, String sort = 'asc'}) async {
    try{
      final data =  await _librasService.getLibrasByWord(pages: pages, palavra: palavra, size: size, sort: sort);
      var response = PaginatedResponse.fromJson(data, (json)=> LibrasResponseModel.fromJson(json as Map<String, dynamic>));
      return response;
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

  @override
  AsyncResult<LibrasResponseModel> findById({required int id}) async {
    try{
      final respone = await _librasService.getLibrasById(id: id);
      final model = LibrasResponseModel.fromJson(respone);
      return Success(model);
    } on DioException catch(e) {
      return Failure(e);
    }
    catch(e){
     return Failure(Exception(e));
    }
  }
}