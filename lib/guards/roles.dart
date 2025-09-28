enum Roles{
  ROLE_ALUNO,
  ROLE_ALUNO_NAPNE,
  ROLE_PROFESSOR,
  ROLE_TUTOR,
  ROLE_INTERPRETE
}
Roles roleFromString(String role) {
  return Roles.values.firstWhere(
        (e) => e.toString().split('.').last == role,
    orElse: () => Roles.ROLE_ALUNO,
  );
}