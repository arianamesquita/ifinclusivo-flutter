
import '../../domain/models/enums/categorias.dart';

abstract class ForumService{
  Future<Map<String, dynamic>> createPublication(Map<String, dynamic> publicacaoRequest);

  Future<Map<String, dynamic>> findAll({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  });
  Future<Map<String, dynamic>> findById(int id);
  Future<Map<String, dynamic>> findRespostas({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });
}