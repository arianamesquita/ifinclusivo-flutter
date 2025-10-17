import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/account_header.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/bottom_bar_publication.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/content_card.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/list_chips_card.dart';


class PublicacaoCard extends StatelessWidget {
  final PublicacaoDetalhadaModel model;
  final void Function()? onTap;
  final List<PopupMenuEntry<dynamic>> menuItems;

const PublicacaoCard({super.key, required this.model,required this.onTap, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap:onTap,
          focusColor: Colors.transparent,
          mouseCursor: SystemMouseCursors.grab,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: AccountHeader.mine(
                    nameUser: model.usuario.nome,
                    imgPath: null,
                    isAnswerAccepted: false,
                    canMarkAsAnswer: false,
                    menuItems: menuItems,
                    onUnmarkAnswer: () {}, onMarkAnswer: () {  },
                    dataCriacao: model.dataCriacao,
                  ),
                ),
                ContentCard(
                  title: model.titulo,
                  contentJson:model.texto,
                  onPressed:()=> PublicacaoRouter(model.id).go(context),
                ),
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
                    PublicacaoRouter(model.id).go(context);
                  },
                  onShare: () {
                    print("abrir opções de compartilhamento");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
