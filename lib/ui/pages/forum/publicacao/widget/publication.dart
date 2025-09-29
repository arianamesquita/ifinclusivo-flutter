import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';
import 'cards/widgets/account_header.dart';
import 'cards/widgets/bottom_bar_publication.dart';
import 'cards/widgets/content_card.dart';
import 'cards/widgets/list_chips_card.dart';

class Publication extends StatefulWidget {
  final PublicacaoDetalhadaModel model;

  const Publication({super.key, required this.model});

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  late final QuillController _controller;
  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: _loadDocument(),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  Document _loadDocument() {
    try {
      final List<dynamic> jsonData = jsonDecode(widget.model.texto);
      return Document.fromJson(jsonData);
    } catch (e) {
      print('Erro ao carregar o documento Quill: $e');
      return Document()..insert(0, 'Erro ao carregar conteúdo.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountHeader.mine(
          nameUser: widget.model.usuario.nome,
          imgPath: null,
          isAnswerAccepted: false,
          canMarkAsAnswer: false,
          menuItems: [
            PopupMenuItem(
              value: "denuciar",
              child: Text("Denuciar"),
              onTap: () {
                // callback editar
                print("Editar publicação");
              },
            ),
          ],
          onUnmarkAnswer: () {},
          onMarkAnswer: () {},
          dataCriacao: widget.model.dataCriacao,
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
            // chamada ao backend (async, mas UI já mudou)
            print("like/unlike API");
          },
          onComment: () {
            context.push(
              NewPublicacaoRouter().location,
              extra: widget.model,
            );
          },
          onShare: () {
            print("abrir opções de compartilhamento");
          },
        ),
      ],
    );
  }
}
