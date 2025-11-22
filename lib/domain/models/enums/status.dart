
enum Status{
  APROVADO,
  REPROVADO,
  EMANALISE;
}
extension StatusExtension on Status {
  String get nomeEmPortugues {
    switch (this) {
      case Status.APROVADO:
        return 'Aprovado';
      case Status.REPROVADO:
        return 'Reprovado';
      case Status.EMANALISE:
        return 'Em Análise';
    }
  }

  static Status fromString(String texto) {
    final textoLimpo = texto.trim().toLowerCase();
    switch (textoLimpo) {
      case 'Aprovado':
        return Status.APROVADO;
      case 'Reprovado':
        return Status.REPROVADO;
      case 'Em análise':
      case 'Em analise':
        return Status.EMANALISE;
      default:
        throw Exception('Status inválido: $texto');
    }
  }
}