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
    await fetchRelacionados(id: id);
    final result = await _repository.findById(id: id);
   return result;
  }


  List<LibrasRelacionadasModel> _relacionados = [];
  List<LibrasRelacionadasModel> get relacionados => _relacionados;
  bool loading = false;

  fetchRelacionados({required int id}) async{
    loading = true;
    notifyListeners();

    final result = await _repository.fetchRelatedById(id: id);
    result.fold((onSuccess)=> _relacionados = onSuccess.content, (onFailure)=> _relacionados=[]);

    loading = false;
    notifyListeners();

  }


}
