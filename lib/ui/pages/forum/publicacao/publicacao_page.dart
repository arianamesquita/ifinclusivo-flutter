import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_editor.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_tile.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/publication_content.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:provider/provider.dart';
import 'package:result_command/result_command.dart';

import '../../../../domain/models/enums/categorias.dart';
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
  final ValueNotifier<bool> _clearEditorNotifier = ValueNotifier(false);

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
    _viewModel.deleteCommentsCommand.addListener(_onDeleteCommentChanged);
    _viewModel.addCommentsCommand.addListener(_onAddCommentsChanged);
  }

  void _onAddCommentsChanged() {
    final cmd = _viewModel.addCommentsCommand;

    switch (cmd.value) {
      case FailureCommand<ComentarioResponseModel>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao adicionar comentário.'),
            backgroundColor: Colors.red,
          ),
        );
        cmd.reset();
        break;
      case SuccessCommand<ComentarioResponseModel>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Comentário adicionado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        _clearEditorNotifier.value = true;
        cmd.reset();
        break;
      case IdleCommand<ComentarioResponseModel>():
      case CancelledCommand<ComentarioResponseModel>():
      case RunningCommand<ComentarioResponseModel>():
        return;
    }
  }

  void _onDeleteCommentChanged() {
    final cmd = _viewModel.deleteCommentsCommand;
    switch (cmd.value) {
      case IdleCommand<bool>():
      case CancelledCommand<bool>():
      case RunningCommand<bool>():
        return;
      case FailureCommand<bool>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao apagar comentário.'),
            backgroundColor: Colors.red,
          ),
        );

      case SuccessCommand<bool>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Comentário apagado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Conecta IF",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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

  buildBody(BuildContext context, PublicacaoDetalhadaModel value) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.spacingColumn(context),
          ),
          child:
              ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile
                  ? buildContantPage(value, context)
                  : Card(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 5),
                    child: buildContantPage(value, context),
                  ),
        ),
      ),
    );
  }

  Padding buildContantPage(
    PublicacaoDetalhadaModel value,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: PublicationContent(model: value),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: ListenableBuilder(
              listenable: _viewModel.addCommentsCommand,
              builder: (context, _) {
                return CommentEditor.add(
                  imgPath: _viewModel.currentUser?.imgPerfil,
                  onSubmit: _sendReply,
                  isLoading: _viewModel.addCommentsCommand.value.isRunning,
                  clearNotifier: _clearEditorNotifier,
                );
              },
            ),
          ),
          buildOrderBar(context),
          buildChildrenPublication(publicationId: value.id),
        ],
      ),
    );
  }

  Future<void> _sendReply(String text) async {
    _viewModel.addCommentsCommand.execute(
      _viewModel.publication!.id,
      ComentarioRequestModel(texto: text),
    );
  }

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
              if (_viewModel.comments.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
                    child: Text(
                      'Sem Comentários',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                );
              }

              return Column(
                children:
                    _viewModel.comments.map((model) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              right: 12,
                              top: 8,
                            ),
                            child: CommentTile(
                              key: ValueKey(model.comment.id),
                              viewModel: _viewModel,
                              userName: model.comment.usuario.nome,
                              autorId: model.comment.usuario.id,
                              taggedUser: model.comment.usuarioMencionado?.nome,
                              parentId: model.comment.id,
                              dateCreation: model.comment.dataCriacao,
                              replyCount: model.comment.totalRespostas,
                              publicationText: model.comment.texto,
                              commentId: model.comment.id,
                              publicationId: model.comment.publicacaoId,
                              imgPath: model.comment.usuario.imgPerfil,
                            ),
                          ),
                          if (_viewModel.comments.last.comment.id !=
                              model.comment.id)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Divider(),
                            ),
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
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Erro: $error'),
                  ),
                );

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
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                  style: Theme.of(context).textTheme.labelLarge,
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
