import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/account_header.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/bottom_bar_publication.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/content_card.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/cards/widgets/list_chips_card.dart';

class PublicacaoCard extends StatelessWidget {
  final PublicacaoCardModel model;
  const PublicacaoCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountHeader.mine(
              nameUser: model.autor.nome,
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
              isCollapsible: true,
              title: model.titulo,
              content:model.texto),
            ListChipsCard(categorias: model.categorias),

            BottomBarPublication(
              likes: model.likesCount,
              comments: model.comentariosCount,
              isLiked: model.isLiked, // já curtido pelo usuário
              onLike: () {
                // chamada ao backend (async, mas UI já mudou)
                print("like/unlike API");
              },
              onComment: () {
                print("abrir comentários");
              },
              onShare: () {
                print("abrir opções de compartilhamento");
              },
            ),
          ],
        ),
      ),
    );
  }
}
