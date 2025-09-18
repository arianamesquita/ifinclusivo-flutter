
import 'package:if_inclusivo/domain/models/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/simple_model/gen_simple_models.dart';

import '../../../domain/models/response/gen_responses.dart';

abstract class AuthRepository{

  Stream<UsuarioResponseModel?> get authStateChanges;

  UsuarioResponseModel? get currentUser;


  Future<UsuarioResponseModel> login(String email, String password);

  Future<void> logout();

  Future<SimpleUsuarioModel> registerTutor(TutorRequestModel tutorData);

  Future<String> forgotPassword(String email);
  Future<String> resetPassword(String token, String newPassword);
}