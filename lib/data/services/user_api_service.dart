import '../../guards/roles.dart';

abstract class UserApiService {
  Future<List<Map<String, dynamic>>> searchUsers({String? name, Roles? role});
}