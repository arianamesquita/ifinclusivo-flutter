import 'package:result_dart/result_dart.dart';

import '../../domain/models/api/request/gen_requests.dart';
import '../../domain/models/api/response/gen_responses.dart';
import '../../domain/models/enums/categorias.dart';
import '../../domain/models/gen_models.dart';

abstract class LibrasRepository{
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias});
  AsyncResult<LibrasResponseModel> saveWord(LibrasRequestModel model);
}