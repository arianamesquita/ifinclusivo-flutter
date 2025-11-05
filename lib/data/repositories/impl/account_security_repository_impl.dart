
import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/data/services/account_security_service.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/models/api/request/gen_requests.dart';
import '../../../exceptions/api_exception.dart';

class AccountSecurityRepositoryImpl implements AccountSecurityRepository{
  final AccountSecurityService _service;

  AccountSecurityRepositoryImpl({required AccountSecurityService service}) : _service = service;

  @override
  AsyncResult<bool> deleteAccount(String password) async{
    try {
      final state = await _service.deleteAccount(password);
      return Success(state);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<bool> updatePassword(UpdatePasswordRequestModel updatePassword) async {
    try {
      final state = await _service.updatePassword(
          updatePassword.toJson());
      return Success(state);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
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
        case 404:
          throw NotFoundException(message: errorMessage);
        case 409:
          throw ApiException(message: errorMessage, statusCode: statusCode);
        default:
          throw ApiException(message: errorMessage, statusCode: statusCode);
      }
    }
    throw Exception(
      'Falha de conexão. Verifique sua internet e tente novamente.',
    );
  }

  // @override
  // Future<UsuarioResponseModel> getUserById(int id, String token) async {
  //   final response = await _api.getUserById(id, token);
  //   final fetchedUser = UsuarioResponseModel.fromJson(response);
  //
  //   print("o usuário foi pego $fetchedUser");
  //
  //   return fetchedUser;
  // }
}