import 'package:dio/dio.dart';
import 'package:if_inclusivo/data/services/user_api_service.dart';

import '../../../guards/roles.dart';

class UserApiServiceImpl implements UserApiService {

  final Dio _dio;

  UserApiServiceImpl({required Dio dio}) : _dio = dio;



  @override
  Future<List<Map<String, dynamic>>> searchUsers({String? name, Roles? role}) async {
    final queryParams = {
      if (name != null) 'name': name,
      if (role != null) 'role': role.name,
    };

    final response = await _dio.get('/users/search', queryParameters: queryParams);
    // Retorna a lista de JSONs
    return List<Map<String, dynamic>>.from(response.data);
  }
}