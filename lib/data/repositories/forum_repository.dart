import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';

abstract class ForumRepository{
  Future<PublicacaoDetalhadaModel> create(PublicacaoRequestModel request);
}