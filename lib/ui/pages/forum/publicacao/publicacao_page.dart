import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_editor.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_tile.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/viewmodels/comment_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/publication_content.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';
import 'package:result_command/result_command.dart';

import '../../../../domain/models/enums/categorias.dart';
import '../../../../routing/app_router.dart';
import '../feed/widgets/sort_dropdown_button.dart';

class PublicacaoPage extends StatefulWidget {
  final int id;
  const PublicacaoPage({super.key, required this.id});

  @override
  State<PublicacaoPage> createState() => _PublicacaoPageState();
}

class _PublicacaoPageState extends State<PublicacaoPage> {
  String _selectedOrder = 'Relevância';
  late final ScrollController _scrollController;
  late final PublicacaoViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<PublicacaoViewModel>();
    _scrollController = ScrollController(
      initialScrollOffset: _viewModel.scrollOffset,
    );

    _scrollController.addListener(() {
      _viewModel.scrollOffset = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post'), centerTitle: true,),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          if (_viewModel.isDeleted) {
            return Center(child: Text('Esta publicação foi removida.'));
          }

          if (_viewModel.publication != null) {
            return buildBody(context, _viewModel.publication!);
          }
          return ListenableBuilder(
            listenable: _viewModel.fetchPublicationCommand,
            builder: (context, _) {
              final state = _viewModel.fetchPublicationCommand.value;
              switch (state) {
                case RunningCommand<PublicacaoDetalhadaModel>():
                  return const Center(child: CircularProgressIndicator());
                case FailureCommand<PublicacaoDetalhadaModel>(:final error):
                  return Center(child: Text('Erro: ${error.toString()}'));
                case SuccessCommand<PublicacaoDetalhadaModel>():
                case IdleCommand<PublicacaoDetalhadaModel>():
                case CancelledCommand<PublicacaoDetalhadaModel>():
                  return const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }

  Center buildBody(BuildContext context, PublicacaoDetalhadaModel value) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveUtils.spacingColumn(context),
        ),
        child: Card(
          color: Theme.of(context).colorScheme.surfaceContainer,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PublicationContent(model: value),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: CommentEditor.add(onSubmit: _sendReply,),
                    ),
                    buildOrderBar(context),
                    buildChildrenPublication(publicationId: value.id),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _sendReply(String text) async {}
  ListenableBuilder buildChildrenPublication({required int publicationId}) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_viewModel.showDeletedSnack) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Publicação apagada com sucesso!'),
                backgroundColor: Colors.green,
              ),
            );
            _viewModel.showDeletedSnack = false;
          }
          if (_viewModel.showErrorSnack) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_viewModel.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
            _viewModel.showErrorSnack = false;
          }
        });



        if (!_viewModel.fetchRespostasCommand.value.isRunning &&
            !_viewModel.fetchRespostasCommand.value.isFailure) {
          return Consumer<PublicacaoViewModel>(
            builder: (context, vm, state) {
              return Column(
                children:
                _viewModel.respostas.map((model) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: CommentTile(
                            userName: model.usuario.nome,
                            autorId: model.usuario.id,
                            taggedUser: model.usuarioMencionado?.nome,
                            dateCreation: model.dataCriacao,
                            replyCount: model.totalRespostas,
                            publicationText: model.texto,
                            commentId: model.id,
                        publicationId: model.publicacaoId,),
                      ),
                      if (_viewModel.respostas.last.id != model.id)
                        Divider(),
                    ],
                  );
                }).toList(),
              );
            },
          );
        }

        return ListenableBuilder(
          listenable: _viewModel.fetchRespostasCommand,
          builder: (context, _) {
            final respostaState = _viewModel.fetchRespostasCommand.value;
            switch (respostaState) {
              case RunningCommand<List<ComentarioResponseModel>>():
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 80.0),
                    child: CircularProgressIndicator(),
                  ),
                );

              case FailureCommand<List<ComentarioResponseModel>>(:final error):
                return Center(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Erro: $error'),
                ));

              case SuccessCommand<List<ComentarioResponseModel>>():
              case IdleCommand<List<ComentarioResponseModel>>():
              case CancelledCommand<List<ComentarioResponseModel>>():
                return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }

  Column buildOrderBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Soluções da comunidade:',
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge,
                  softWrap: true,
                ),
              ),
              SortDropdownButton(
                menuItems: ['Relevância', 'Mais recente'],
                selectedItem: _selectedOrder,
                onSelected: (String value) async {
                  setState(() {
                    _selectedOrder = value;
                  });
                  final ordenar =
                  value == 'Mais recente'
                      ? Ordenacao.MAIS_RECENTE
                      : Ordenacao.RELEVANCIA;

                  // Agora dispara o command do ViewModel

                  _viewModel.fetchRespostasCommand.execute(widget.id, ordenar);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),
      ],
    );
  }

  _showDialog(PublicacaoViewModel vm, model) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmar exclusão"),
          content: const Text(
            "Tem certeza que deseja excluir esta publicação? Essa ação não poderá ser desfeita.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () async {
                Navigator.of(context).pop();
                await vm.deleteResposta(model.id);
              },
              child: const Text("Excluir"),
            ),
          ],
        );
      },
    );
  }

}