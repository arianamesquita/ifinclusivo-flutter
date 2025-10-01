import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';

import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';

import '../../../../../../data/repositories/auth_repository.dart';
import '../../../../../../domain/models/api/response/gen_responses.dart';

enum NewPublicationState { idle, loading, success, failure }

class NewPublicationViewModel extends ChangeNotifier {
  NewPublicationViewModel({
    required ForumRepository forumRepository,
    required AuthRepository authRepository,
  }) : _forumRepository = forumRepository,
       _authRepository = authRepository{
    currentUser = _authRepository.currentUser;
  }

  final ForumRepository _forumRepository;
  final AuthRepository _authRepository;

  UsuarioResponseModel? currentUser;


  NewPublicationState _state = NewPublicationState.idle;
  NewPublicationState get state => _state;

  PublicacaoDetalhadaModel? createdPublication;
  String? errorMessage;

  Future<PublicacaoDetalhadaModel?> postPublication(PublicacaoRequestModel request) async {
    _state = NewPublicationState.loading;
    notifyListeners();
      final newPublication = await _forumRepository.create(request);
      return newPublication.fold(
          (onSuccess){
            createdPublication = onSuccess;
            _state = NewPublicationState.success;
            notifyListeners();
            return onSuccess;
          },
          (onFailure){
            errorMessage = onFailure.toString();
            _state = NewPublicationState.failure;
            notifyListeners();

            return null;
          });
  }

  void resetState() {
    _state = NewPublicationState.idle;
    errorMessage = null;
    createdPublication = null;
    notifyListeners();
  }
}
