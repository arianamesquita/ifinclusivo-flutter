import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../data/repositories/libras_repository.dart';
import '../../../../../domain/models/api/request/gen_requests.dart';

class WordSuggestionViewModel extends ChangeNotifier {
  late final Command1<LibrasResponseModel, SugereLibrasUploadModel> saveWordCmd;
  final LibrasRepository _librasRepository;

  WordSuggestionViewModel({required LibrasRepository librasRepository})
    : _librasRepository = librasRepository {
    saveWordCmd = Command1(_saveWord);
  }

  AsyncResult<LibrasResponseModel> _saveWord(SugereLibrasUploadModel model) async =>
      await _librasRepository.saveWord(model);
}
