import '../../domain/models/enums/categorias.dart';

abstract class ForumService {
  Future<Map<String, dynamic>> createPublication(
    Map<String, dynamic> publicacaoRequest,
  );

  Future<Map<String, dynamic>> findAll({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  });
  Future<Map<String, dynamic>> findById(int id);

  Future<void> deletePublication(int id);

  Future<Map<String, dynamic>> updatePublication({
    required int id,
    required Map<String, dynamic> publicacaoRequest,
  });

  //comentarios e respostas

  Future<Map<String, dynamic>> addComment({
    required int publicacaoId,
    required Map<String, dynamic> commentRequest,
  });

  Future<Map<String, dynamic>> findComments({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });

  Future<Map<String, dynamic>> findReplies({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });
}
