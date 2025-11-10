import 'package:result_dart/result_dart.dart';

import '../../domain/models/api/request/gen_requests.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/models/api/response/gen_responses.dart';
import '../../domain/models/enums/categorias.dart';
import '../../domain/models/gen_models.dart';

abstract class LibrasRepository{
  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByTopic({int pages = 0, int size = 10, Categorias? categorias});
  AsyncResult<LibrasResponseModel> saveWord(SugereLibrasUploadModel model);

  AsyncResult<LibrasResponseModel> findById({required int id});

  Future<PaginatedResponse<LibrasResponseModel>> getLibrasByWord({String? palavra, int pages = 0, int size = 10, String sort = 'asc' });

  AsyncResult<List<String>> searchSuggestions({required String query});
  AsyncResult<PaginatedResponse<LibrasRelacionadasModel>> fetchRelatedById({
    int page = 0,
    int size = 5,
    required int id
  });

}