
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

abstract class AccountSecurityRepository {
  AsyncResult<bool> updatePassword(
      UpdatePasswordRequestModel updatePassword);

  AsyncResult<bool> deleteAccount( String password );

  //Future<UsuarioResponseModel> getUserById(int id, String token);
}