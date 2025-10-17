import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/enums/categorias.dart';
import '../../domain/models/gen_models.dart';

abstract class ForumRepository {
  AsyncResult<PublicacaoDetalhadaModel> savePublication(PublicacaoRequestModel request);

  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> fetchFeedPublication({
    Set<Categorias>? categorias,
    Ordenacao? ordenarPor,
    int page = 0,
    int size = 10,
  });

  AsyncResult<PublicacaoDetalhadaModel> findById(int id);
  AsyncResult<bool> toggleLikePublication(int publicationId);

  AsyncResult<PublicacaoDetalhadaModel> updatePublication(
    int id,
    PublicacaoRequestModel request,
  );
  AsyncResult<void> deletePublication(int id);


  AsyncResult<ComentarioResponseModel> addComment({
    required int publicationId,
    required ComentarioRequestModel request,
  });

  AsyncResult<ComentarioResponseModel> updateComment({
    required int commentId,
    required ComentarioRequestModel request,
  });
  AsyncResult<PaginatedResponse<ComentarioResponseModel>> fetchComments({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });

  AsyncResult<PaginatedResponse<ComentarioResponseModel>> fetchReplies({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });

  AsyncResult<void> deleteComment(int commentId);
}
