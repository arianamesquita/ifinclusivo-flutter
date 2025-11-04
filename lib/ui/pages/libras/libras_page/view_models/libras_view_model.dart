import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/libras_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';

class LibrasViewModel extends ChangeNotifier {
  final LibrasRepository _repository;

  LibrasViewModel({required LibrasRepository repository})
    : _repository = repository{
    fetchLibrasCmd = Command1(fetchLibras);
  }

  late final Command1<LibrasResponseModel, int> fetchLibrasCmd;

  AsyncResult<LibrasResponseModel> fetchLibras(int id) async {
    final result = await _repository.findById(id: id);
   return result;
  }

}
