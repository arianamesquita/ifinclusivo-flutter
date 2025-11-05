
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

abstract class AccountSecurityRepository {
  AsyncResult<bool> updatePassword(
      UpdatePasswordRequestModel updatePassword);

  AsyncResult<bool> deleteAccount( String password );

  AsyncResult<UsuarioResponseModel> findById({int? id});
  AsyncResult<UsuarioResponseModel> updateAluno({
    required AlunoDetailsRequestModel alunoDetails,
  });
  AsyncResult<UsuarioResponseModel> updateAlunoNapne({
    required AlunoNapneDetailsRequestModel alunoNapneDetails,
  });
  AsyncResult<UsuarioResponseModel> updateProfessor({
    required ProfessorDetailsRequestModel professorDetails,
  });
  AsyncResult<UsuarioResponseModel> updateTutor({
    required TutorDetailsRequestModel tutorDetails,
  });
  AsyncResult<UsuarioResponseModel> updateInterprete({
    required InterpreteDetailsRequestModel interpreteDetails,
  });
}