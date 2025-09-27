import 'package:flutter/material.dart';

import '../../../../../../../utils/date_utils.dart';

class AccountHeader extends StatelessWidget {
  final String nameUser;
  final String? imgPath;
  final bool isAnswerAccepted; // se essa publicação foi aceita como resposta
  final bool canMarkAsAnswer; // se o usuário pode marcar/desmarcar
  final List<PopupMenuEntry> menuItems;
  final VoidCallback? onMarkAnswer;
  final VoidCallback? onUnmarkAnswer;
  final DateTime dataCriacao;

  const AccountHeader._({
    required this.nameUser,
    required this.imgPath,
    required this.isAnswerAccepted,
    required this.canMarkAsAnswer,
    required this.menuItems,
    required this.onMarkAnswer,
    required this.onUnmarkAnswer,
    required this.dataCriacao,
  });

  factory AccountHeader.mine({
    required String nameUser,
    required String? imgPath,
    required bool
    isAnswerAccepted, // se essa publicação foi aceita como resposta
    required bool canMarkAsAnswer, // se o usuário pode marcar/desmarcar
    required List<PopupMenuEntry> menuItems,
    required VoidCallback? onMarkAnswer,
    required VoidCallback? onUnmarkAnswer,
    required DateTime dataCriacao,
  }) => AccountHeader._(
    nameUser: nameUser,
    isAnswerAccepted: isAnswerAccepted,
    canMarkAsAnswer: canMarkAsAnswer,
    menuItems: menuItems,
    imgPath: imgPath,
    onMarkAnswer: onMarkAnswer,
    onUnmarkAnswer: onUnmarkAnswer,
    dataCriacao: dataCriacao,
  );

  factory AccountHeader.others({
    required String nameUser,
    required String? imgPath,
    required bool isAnswerAccepted,
    required List<PopupMenuEntry> menuItems,
    required DateTime dataCriacao,
  }) => AccountHeader._(
    nameUser: nameUser,
    isAnswerAccepted: isAnswerAccepted,
    canMarkAsAnswer: false,
    menuItems: menuItems,
    imgPath: imgPath,
    onMarkAnswer: null,
    onUnmarkAnswer: null,
    dataCriacao: dataCriacao,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 15, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                CircleAvatar(
                  backgroundImage:
                      (imgPath != null && imgPath!.isNotEmpty)
                          ? NetworkImage(imgPath!)
                          : null,
                ),
                Expanded(
                  child: Wrap(
                    spacing: 5,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        nameUser,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        formatTimeAgo(dataCriacao),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (canMarkAsAnswer && isAnswerAccepted)
                Tooltip(
                  message: 'Desmarcar como resposta aceita',
                  child: IconButton.filled(
                    onPressed: onUnmarkAnswer,
                    icon: const Icon(Icons.undo),
                  ),
                ),

              if (canMarkAsAnswer && !isAnswerAccepted)
                Tooltip(
                  message: 'Marcar como resposta aceita',
                  child: IconButton.filled(
                    onPressed: onMarkAnswer,
                    icon: const Icon(Icons.add_task),
                  ),
                ),
              if (!canMarkAsAnswer && isAnswerAccepted)
                Tooltip(
                  message: 'Esta publicação foi marcada como resposta',
                  child: Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 22,
                      ),
                      Text(
                        'Resposta aceita',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz),
                itemBuilder: (context) => menuItems, // <<< menus do pai
              ),
            ],
          ),
        ],
      ),
    );
  }
}
