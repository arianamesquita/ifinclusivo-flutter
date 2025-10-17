

import '../../domain/models/api/request/gen_requests.dart';
import '../../domain/models/api/response/gen_responses.dart';
import '../../domain/models/api/simple_model/gen_simple_models.dart';

abstract class AuthRepository{

  Stream<UsuarioResponseModel?> get authStateChanges;

  UsuarioResponseModel? get currentUser;

  Future<UsuarioResponseModel> login(String email, String password);

  Future<void> logout();

  Future<SimpleUsuarioModel> registerTutor(TutorRequestModel tutorData);

  Future<SimpleUsuarioModel> registerProfessor(ProfessorRequestModel professorData);

  Future<SimpleUsuarioModel> registerInterprete(InterpreteRequestModel interpreteData);

  Future<SimpleUsuarioModel> registerAluno(AlunoRequestModel alunoData);

  Future<String> verifyEmail(String token);

  Future<String> forgotPassword(String email);

  Future<String> resetPassword(String token, String newPassword);
}