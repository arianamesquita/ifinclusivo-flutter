import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';

import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../../domain/models/api/response/gen_responses.dart';

class PublicationEditorViewModel extends ChangeNotifier {
  PublicationEditorViewModel({required ForumRepository forumRepository})
    : _forumRepository = forumRepository {
    addPublicationCommand = Command1(_postPublication);
    updatePublicationCommand = Command2(_updatePublication);
  }

  final ForumRepository _forumRepository;
  late final Command1<PublicacaoDetalhadaModel, PublicacaoRequestModel>
  addPublicationCommand;

  late final Command2<PublicacaoDetalhadaModel, int, PublicacaoRequestModel>
  updatePublicationCommand;

  AsyncResult<PublicacaoDetalhadaModel> _postPublication(
    PublicacaoRequestModel request,
  ) async => await _forumRepository.savePublication(request);

  AsyncResult<PublicacaoDetalhadaModel> _updatePublication(
    int publicationId,
    PublicacaoRequestModel request,
  ) async => await _forumRepository.updatePublication(publicationId, request);
}
