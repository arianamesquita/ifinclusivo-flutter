abstract class AccountSecurityService {
  Future<bool> updatePassword(Map<String, dynamic> updatePaswwordRequest);

  Future<bool> deleteAccount(String password);

  Future<Map<String, dynamic>> findById({required int id});
  Future<Map<String, dynamic>> updateAluno({
    required Map<String, dynamic> alunoDetails,
  });
  Future<Map<String, dynamic>> updateAlunoNapne({
    required Map<String, dynamic> alunoNapneDetails,
  });
  Future<Map<String, dynamic>> updateProfessor({
    required Map<String, dynamic> professorDetails,
  });
  Future<Map<String, dynamic>> updateTutor({
    required Map<String, dynamic> tutorDetails,
  });
  Future<Map<String, dynamic>> updateInterprete({
    required Map<String, dynamic> interpreteDetails,
  });
}
