import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/account_header.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/bottom_bar_publication.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/content_card.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/list_chips_card.dart';

class PublicacaoTile extends StatelessWidget {
  final PublicacaoDetalhadaModel model;
  const PublicacaoTile({super.key, required this.model});

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
            PublicacaoRouter(model.id.toString()).push(context);
          },
          onShare: () {
            print("abrir opções de compartilhamento");
          },
        ),
      ],
    );
  }
}
