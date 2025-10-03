
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:result_dart/result_dart.dart';

abstract class AccountSecurityRepository {
  AsyncResult<bool> updatePassword(
      UpdatePasswordRequestModel updatePassword);

  Future<void> deleteAccount();
}