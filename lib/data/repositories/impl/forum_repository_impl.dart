
import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:if_inclusivo/data/services/forum_service.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';

import '../../../exceptions/api_exception.dart';

class ForumRepositoryImpl implements ForumRepository{
  final ForumService _service;

  ForumRepositoryImpl({required ForumService service}) : _service = service;


  @override
  Future<PublicacaoDetalhadaModel> create(PublicacaoRequestModel request) async {
    try {
      final response = await _service.createPublication(request.toJson());
      final publication = PublicacaoDetalhadaModel.fromJson(response);
      return publication;

    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final responseData = e.response!.data;
        String errorMessage = "Ocorreu um erro inesperado.";
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'];
        }
        switch (statusCode) {
          case 400:
            throw BadRequestException(message: errorMessage, errors: responseData);
          case 401:
            throw UnauthorizedException(message: errorMessage);
          case 404:
            throw NotFoundException(message: errorMessage);
          default:
            throw ApiException(message: errorMessage, statusCode: statusCode);
        }
      }
      throw Exception('Falha de conexão. Verifique sua internet e tente novamente.$e');
    } catch (e) {
      throw Exception('Falha ao processar a resposta do servidor.');
    }
  }

}