
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/services/account_security_service.dart';

class AccountSecurityServiceImpl implements AccountSecurityService {
  final Dio _dio;

  AccountSecurityServiceImpl({required Dio dio}) : _dio = dio;
  final basePath = '/auth/update-password';

  @override
  Future<bool> deleteAccount(String password) async{
    try {
      final response = await _dio.delete("/auth",
          queryParameters: {"password": password});
      return (response.statusCode == 200);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("Erro: ${e.response?.data["message"] ?? e.message}");
      }
      throw Exception("Erro de conexão: ${e.message}");
    }
  }

  @override
  Future<bool> updatePassword(
      Map<String, dynamic>updatePaswwordRequest) async {
    try {
      final response = await _dio.post(
        basePath,
        data: updatePaswwordRequest,
      );
      return (response.statusCode == 200);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("Erro: ${e.response?.data["message"] ?? e.message}");
      }
      throw Exception("Erro de conexão: ${e.message}");
    }
  }


}