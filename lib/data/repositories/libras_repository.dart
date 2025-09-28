import '../../domain/models/api/response/gen_responses.dart';
import '../../domain/models/enums/categorias.dart';
import '../../domain/models/gen_models.dart';

abstract class LibrasRepository{
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias});
}