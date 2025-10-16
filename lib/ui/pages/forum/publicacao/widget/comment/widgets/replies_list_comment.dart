import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/viewmodels/comment_viewmodel.dart';

import '../comment_tile.dart';

class RepliesListComment extends StatelessWidget {
  final int commentId;
  final CommentViewModel viewModel;
  final int userMark;
  const RepliesListComment({
    super.key,
    required this.viewModel,
    required this.commentId, required this.userMark,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...viewModel.replies.map(
              (m) => Row(
                children: [
                  SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      children: [
                        CommentTile.noTree(
                          key: ValueKey(m.id),
                          viewModel: viewModel,
                          userName: m.usuario.nome,
                          taggedUser: m.usuarioMencionado?.nome,
                          dateCreation: m.dataCriacao,
                          replyCount: m.totalRespostas,
                          commentId: m.id,
                          publicationText: m.texto,
                          publicationId: m.publicacaoId, autorId: m.usuario.id,
                          userMark: userMark,
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (viewModel.isLoading) Center(child: CircularProgressIndicator()),
            if (viewModel.hasMore && viewModel.showReplies)
              TextButton(
                onPressed:
                    () => viewModel.fetchReplies(
                      commentId: commentId,
                      append: true,
                    ),
                child: const Text('Carregar mais respostas'),
              ),
            if (!viewModel.hasMore && viewModel.showReplies)
              TextButton(
                onPressed: () {
                  viewModel.cleanReplies();
                },
                child: Text('Esconder respostas'),
              ),
          ],
        );
      },
    );
  }

}
