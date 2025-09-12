

import 'package:if_inclusivo/data/services/registerService.dart';
import 'package:if_inclusivo/domain/models/user/userModel.dart';

class RegisterRepository {
  final RegisterService _registerService;

  RegisterRepository(this._registerService);

  Future<List<UserModel>> getUsers() async{
    return _registerService.fetchUsers();
  }

}