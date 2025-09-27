import 'package:flutter/material.dart';

import '../../../../../domain/models/api/response/gen_responses.dart';
import '../../../../../routing/app_router.dart';
import 'cards/widgets/account_header.dart';
import 'cards/widgets/bottom_bar_publication.dart';
import 'cards/widgets/content_card.dart';
import 'cards/widgets/list_chips_card.dart';

class Publication extends StatelessWidget {
  final PublicacaoDetalhadaModel model;

  const Publication({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AccountHeader.mine(
          nameUser: model.usuario.nome,
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
          onUnmarkAnswer: () {}, onMarkAnswer: () {  },
          dataCriacao: model.dataCriacao,
        ),
        ContentCard(
            title: model.titulo,
            contentJson:model.texto),
        ListChipsCard(categorias: model.categorias),

        BottomBarPublication(
          likes: model.totalLikes,
          comments: model.totalRespostas,
          isLiked: model.curtidoPeloUsuario, // já curtido pelo usuário
          onLike: () {
            // chamada ao backend (async, mas UI já mudou)
            print("like/unlike API");
          },
          onComment: () {
            PublicacaoRouter('1').push(context);
          },
          onShare: () {
            print("abrir opções de compartilhamento");
          },
        ),
      ],
    );
  }
}
