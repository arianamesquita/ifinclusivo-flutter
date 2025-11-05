import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/repositories/account_security_repository.dart';
import 'package:if_inclusivo/data/services/account_security_service.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/api/request/gen_requests.dart';
import '../../../exceptions/api_exception.dart';

class AccountSecurityRepositoryImpl implements AccountSecurityRepository {
  final AccountSecurityService _service;
  final SharedPreferences _prefs;

  static const String _userKey = 'auth_user';

  AccountSecurityRepositoryImpl({
    required AccountSecurityService service,
    required SharedPreferences prefs,
  }) : _service = service,
       _prefs = prefs;

  @override
  AsyncResult<UsuarioResponseModel> findById({int? id}) async {
    try {
      //function auxiliar para buscar o usuario
      AsyncResult<UsuarioResponseModel> fetch({required int id}) async {
        final result = await _service.findById(id: id);
        final user = UsuarioResponseModel.fromJson(result);
        return Success(user);
      }

      if (id == null) {
        final userData = _prefs.getString(_userKey);
        if (userData == null) return Failure(Exception('Erro inesperado'));
        final oldUser = UsuarioResponseModel.fromJson(jsonDecode(userData));

        return await fetch(id: oldUser.id);
      } else {
        return await fetch(id: id);
      }

    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<UsuarioResponseModel> updateAluno({
    required AlunoDetailsRequestModel alunoDetails,
  }) async{
    try {
      final result = await _service.updateAluno(alunoDetails: alunoDetails.toJson());
      final user = UsuarioResponseModel.fromJson(result);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));

      return Success(user);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<UsuarioResponseModel> updateAlunoNapne({
    required AlunoNapneDetailsRequestModel alunoNapneDetails,
  })async {
    try {
      final result = await _service.updateAlunoNapne(alunoNapneDetails: alunoNapneDetails.toJson());
      final user = UsuarioResponseModel.fromJson(result);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));

      return Success(user);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<UsuarioResponseModel> updateInterprete({
    required InterpreteDetailsRequestModel interpreteDetails,
  }) async {
    try {
      final result = await _service.updateInterprete(interpreteDetails: interpreteDetails.toJson());
      final user = UsuarioResponseModel.fromJson(result);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));

      return Success(user);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<UsuarioResponseModel> updateProfessor({
    required ProfessorDetailsRequestModel professorDetails,
  }) async {
    try {
      final result = await _service.updateProfessor(professorDetails: professorDetails.toJson());
      final user = UsuarioResponseModel.fromJson(result);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));

      return Success(user);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<UsuarioResponseModel> updateTutor({
    required TutorDetailsRequestModel tutorDetails,
  })async {
    try {
      final result = await _service.updateTutor(tutorDetails: tutorDetails.toJson());
      final user = UsuarioResponseModel.fromJson(result);
      await _prefs.setString(_userKey, jsonEncode(user.toJson()));

      return Success(user);
    } on DioException catch (e) {
      return Failure(_handleDioError(e));
    } catch (e) {
      return Failure(Exception('Erro inesperado'));
    }
  }

  @override
  AsyncResult<bool> deleteAccount(String password) async {
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
  AsyncResult<bool> updatePassword(
    UpdatePasswordRequestModel updatePassword,
  ) async {
    try {
      final state = await _service.updatePassword(updatePassword.toJson());
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
}
