import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';

import '../comment_tile.dart';

class RepliesListComment extends StatelessWidget {
  final int commentId;
  final PublicacaoViewModel viewModel;
  final int userMark;
  const RepliesListComment({
    super.key,
    required this.viewModel,
    required this.commentId,
    required this.userMark,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final commentNode = viewModel.findCommentById(commentId);
        if (commentNode == null) {
          return SizedBox.shrink();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...viewModel.comments
                  .firstWhere((test) => test.comment.id == commentId)
                  .replies
                  .map(
                    (m) => Row(
                      children: [
                        SizedBox(width: 48),
                        Expanded(
                          child: Column(
                            children: [
                              CommentTile.noTree(
                                key: ValueKey(
                                  m.comment.id,
                                ),
                                viewModel: viewModel,
                                userName: m.comment.usuario.nome,
                                taggedUser: m.comment.usuarioMencionado?.nome,
                                taggedId: m.comment.usuarioMencionado?.id,
                                dateCreation: m.comment.dataCriacao,
                                replyCount: m.comment.totalRespostas,
                                commentId: m.comment.id,
                                parentId: m.comment.parentId,
                                publicationText: m.comment.texto,
                                publicationId: m.comment.publicacaoId,
                                autorId: m.comment.usuario.id,
                                userMark: userMark,
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              if (commentNode.isLoading)
                Center(child: CircularProgressIndicator()),
              if (commentNode.hasMore && commentNode.showReplies)
                TextButton(
                  onPressed:
                      () => viewModel.fetchReplies(
                        commentId: commentId,
                        append: true,
                      ),
                  child: const Text('Carregar mais respostas'),
                ),
              if (!commentNode.hasMore && commentNode.showReplies)
                TextButton(
                  onPressed: () {
                    viewModel.toggleReplies(commentId);
                  },
                  child: Text('Esconder respostas'),
                ),
            ],
          );
        }
      },
    );
  }
}
