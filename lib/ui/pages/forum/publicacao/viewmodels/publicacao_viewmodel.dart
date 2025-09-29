 import 'package:flutter/foundation.dart';
import 'package:if_inclusivo/data/repositories/forum_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../domain/models/enums/categorias.dart';

 enum PublicacaoState {
   loading,
   success,
   error,
 }

 class PublicacaoViewModel extends ChangeNotifier {
   PublicacaoViewModel({required ForumRepository forumRepository})
       : _forumRepository = forumRepository{
     fetchPublicationCommand = Command1<PublicacaoCompletaModel, int>(_fetchPublication);
     fetchRespostasCommand = Command2<List<PublicacaoDetalhadaModel>, int,Ordenacao>(_fetchRespostas);
   }

   final ForumRepository _forumRepository;


   PublicacaoCompletaModel? _publication;
   PublicacaoCompletaModel? get publication => _publication;

   String _errorMessage = "";
   String get errorMessage => _errorMessage;


   List<PublicacaoDetalhadaModel> _respostas=[];
   List<PublicacaoDetalhadaModel> get respostas => _respostas;

   late final Command1<PublicacaoCompletaModel,int > fetchPublicationCommand;
   late final Command2<List<PublicacaoDetalhadaModel>,int, Ordenacao> fetchRespostasCommand;

   AsyncResult<PublicacaoCompletaModel> _fetchPublication(int id) async {
     final result = await _forumRepository.findById(id);
     return result.map((pub) {
       _publication = pub;
       notifyListeners();
       return pub;
     }).mapError((err) {
       _errorMessage = err.toString();
       notifyListeners();
       return err;
     });
   }

   AsyncResult<List<PublicacaoDetalhadaModel>> _fetchRespostas(
       int id,
       Ordenacao order,
       ) async {
     final result = await _forumRepository.findRespostas(
       id: id,
       ordenarPor: order,
       page: 0,
       size: 10,
     );
     return result.map((resp) {
       _respostas = resp.content;
       notifyListeners();
       return resp.content;
     }).mapError((err) {
       _errorMessage = err.toString();
       notifyListeners();
       return err;
     });
   }
 }
