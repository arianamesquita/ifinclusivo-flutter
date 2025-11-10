import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/pages/forum/feed/viewmodels/feed_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:result_command/src/command.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';
import '../../../../../utils/forum_utils.dart';
import 'card/widgets/account_header.dart';
import 'card/widgets/bottom_bar_publication.dart';
import 'card/widgets/list_chips_card.dart';

class PublicationContent extends StatefulWidget {
  const PublicationContent({super.key});

  @override
  State<PublicationContent> createState() => _PublicationContentState();
}

class _PublicationContentState extends State<PublicationContent> {
  late final QuillController _controller;
  late final PublicacaoViewModel _vm;
  @override
  void initState() {
    super.initState();

    _vm = context.read();
    final publication = _vm.publication;

    _controller = QuillController(
      document: loadDocument(text: publication?.texto),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
    _vm.fetchPublicationCommand.addListener(handler);
  }

  handler() {
    final cd = _vm.fetchPublicationCommand;
    switch (cd.value) {
      case IdleCommand<PublicacaoDetalhadaModel>():
      case CancelledCommand<PublicacaoDetalhadaModel>():
      case RunningCommand<PublicacaoDetalhadaModel>():
      case FailureCommand<PublicacaoDetalhadaModel>():
        return;
      case SuccessCommand<PublicacaoDetalhadaModel>(:final value):
        _controller.document = loadDocument(text: value.texto);
        cd.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PublicacaoViewModel>(
      builder: (context, vm, state) {
        final publication = vm.publication;

        if (publication == null) {
          return Center(
            child: Text('Falha ao carregar os dados, tente atualizar a pagina'),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountHeader.mine(
              nameUser: publication.usuario.nome,
              imgPath: publication.usuario.imgPerfil,
              isAnswerAccepted: false,
              canMarkAsAnswer: false,
              menuItems:
                  (vm.currentUser != null &&
                          vm.currentUser!.id == publication.usuario.id)
                      ? [
                        PopupMenuItem(
                          value: "Editar",
                          child: Text("Editar"),
                          onTap: () async {
                            final bool? result = await context.push(
                              NewPublicacaoRouter().location,
                              extra: publication,
                            );
                            if (result == true && context.mounted) {
                              vm.fetchPublicationCommand.execute(
                                publication.id,
                              );
                            }
                          },
                        ),
                        PopupMenuItem(
                          value: "Excluir",
                          child: Text("Excluir"),
                          onTap: () {
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
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(context).colorScheme.error,
                                        foregroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onError,
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await vm.deletePublicationCommand
                                            .execute(publication.id);
                                      },
                                      child: const Text("Excluir"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ]
                      : [
                        PopupMenuItem(
                          value: "denunciar",
                          child: Text("Denunciar"),
                          onTap: () {
                            print("Denunciar publicação");
                          },
                        ),
                      ],
              onUnmarkAnswer: () {},
              onMarkAnswer: () {},
              dataCriacao: publication.dataCriacao,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    publication.titulo,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  QuillEditor.basic(
                    controller: _controller,
                    config: const QuillEditorConfig(
                      autoFocus: false,
                      padding: EdgeInsets.zero,
                      scrollable: false,
                      showCursor: false,
                      enableSelectionToolbar: false,
                    ),
                  ),
                ],
              ),
            ),
            ListChipsCard(categorias: publication.categorias),

            BottomBarPublication(
              likes: publication.totalLikes,
              comments: publication.totalRespostas,
              isLiked:
                  publication.curtidoPeloUsuario, // já curtido pelo usuário
              onLike: () {
                vm.toggleLikePublication(publication.id);
              },
              isLoggedIn: vm.currentUser != null,
              onComment: null,
              onShare: () async {
                const String baseUrl = "https://if-inclusivo.web.app/";                final String publicationUrl =
                    "$baseUrl/#/app/forum/post/${publication.id}";
                if (kIsWeb) {
                  // ------ LÓGICA PARA WEB ------
                  try {
                    // Copia o link para a área de transferência
                    await Clipboard.setData(
                      ClipboardData(text: publicationUrl),
                    );

                    // (Recomendado) Mostra um feedback para o usuário
                    // 'context' precisa estar disponível neste escopo
                    if (context.mounted) {
                      // Boa prática: verificar se o widget ainda está montado
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Link copiado para a área de transferência!',
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } catch (e) {
                    // Em alguns casos (ex: iframes seguros), o clipboard pode falhar
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao copiar o link.'),
                        ),
                      );
                    }
                  }
                } else {
                  final String shareText =
                      "Confira esta publicação interessante: $publicationUrl";
                  Share.share(shareText);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
