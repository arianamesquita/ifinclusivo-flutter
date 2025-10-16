import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/enums/categorias.dart';
import '../../domain/models/gen_models.dart';

abstract class ForumRepository {
  AsyncResult<PublicacaoDetalhadaModel> create(PublicacaoRequestModel request);
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> findAll({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  });
  AsyncResult<PaginatedResponse<ComentarioResponseModel>> findComments({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });

  AsyncResult<PaginatedResponse<ComentarioResponseModel>> findReplies({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });
  AsyncResult<PublicacaoDetalhadaModel> findById(int id);

  AsyncResult<PublicacaoDetalhadaModel> update(
    int id,
    PublicacaoRequestModel request,
  );
  AsyncResult<void> delete(int id);

  AsyncResult<ComentarioResponseModel> addComment({
    required int publicationId,
    required ComentarioRequestModel request,
  });
  AsyncResult<ComentarioResponseModel> updateComment({
    required int commentId,
    required ComentarioRequestModel request,
  });
}
