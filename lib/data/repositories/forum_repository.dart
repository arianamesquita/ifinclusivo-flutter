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
  AsyncResult<PaginatedResponse<PublicacaoDetalhadaModel>> findRespostas({
    required int id,
    Ordenacao ordenarPor = Ordenacao.MAIS_RECENTE,
    int page = 0,
    int size = 10,
  });
  AsyncResult<PublicacaoCompletaModel> findById(int id);
}
