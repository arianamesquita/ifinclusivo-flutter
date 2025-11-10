import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/account_header.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/bottom_bar_publication.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/content_card.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/card/widgets/list_chips_card.dart';

class PublicacaoCard extends StatelessWidget {
  final PublicacaoDetalhadaModel model;
  final void Function()? onTap;
  final void Function()? onLike;
  final List<PopupMenuEntry<dynamic>> menuItems;
  final bool isLoggedIn;

  const PublicacaoCard({
    super.key,
    required this.model,
    required this.onTap,
    required this.menuItems,
    this.onLike,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 800),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
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
                    imgPath: model.usuario.imgPerfil,
                    isAnswerAccepted: false,
                    canMarkAsAnswer: false,
                    menuItems: menuItems,
                    onUnmarkAnswer: () {},
                    onMarkAnswer: () {},
                    dataCriacao: model.dataCriacao,
                  ),
                ),
                ContentCard(
                  title: model.titulo,
                  contentJson: model.texto,
                  onPressed: () => PublicacaoRouter(model.id).go(context),
                ),
                ListChipsCard(categorias: model.categorias),

                BottomBarPublication(
                  likes: model.totalLikes,
                  comments: model.totalRespostas,
                  isLiked: model.curtidoPeloUsuario,
                  isLoggedIn: isLoggedIn,
                  onLike: onLike,
                  onComment: () {
                    PublicacaoRouter(model.id).go(context);
                  },
                  onShare: () async {
                    const String baseUrl = "https://if-inclusivo.web.app/";
                    final String publicationUrl =
                        "$baseUrl/#/app/forum/post/${model.id}";
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
            ),
          ),
        ),
      ),
    );
  }
}
