
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';
import '../../../../../utils/forum_utils.dart';
import 'card/widgets/account_header.dart';
import 'card/widgets/bottom_bar_publication.dart';
import 'card/widgets/list_chips_card.dart';


class PublicationContent extends StatefulWidget {
  final PublicacaoDetalhadaModel model;

  const PublicationContent({super.key, required this.model});

  @override
  State<PublicationContent> createState() => _PublicationContentState();
}

class _PublicationContentState extends State<PublicationContent> {
  late final QuillController _controller;
  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: loadDocument(text: widget.model.texto),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer<PublicacaoViewModel>(
          builder: (context,vm, state) {
            return AccountHeader.mine(
              nameUser: widget.model.usuario.nome,
              imgPath: null,
              isAnswerAccepted: false,
              canMarkAsAnswer: false,
              menuItems: (vm.currentUser != null &&
                  vm.currentUser!.id ==
                      widget.model
                          .usuario
                          .id)
                  ? [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                  onTap: () {
                    print("Editar publicação");
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
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await vm.deletePublication(widget.model.id);
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
              dataCriacao: widget.model.dataCriacao,
            );
          }
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                widget.model.titulo,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
        ListChipsCard(categorias: widget.model.categorias),

        BottomBarPublication(
          likes: widget.model.totalLikes,
          comments: widget.model.totalRespostas,
          isLiked: widget.model.curtidoPeloUsuario, // já curtido pelo usuário
          onLike: () {

          },
          onComment: () {
            context.push(
              NewPublicacaoRouter().location,
              extra: widget.model,
            );
          },
          onShare: () {
          },
        ),

      ],
    );
  }
}
