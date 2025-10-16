import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/viewmodels/comment_viewmodel.dart';

class ActionsBarComment extends StatelessWidget {
  final CommentViewModel viewModel;
  final void Function()? onReply;
  final void Function()? onLike;
  final void Function()? openReplies;
  final void Function()? closeReplies;
  final int replyCount;

  const ActionsBarComment({
    super.key,
    required this.viewModel,
    required this.onReply,
    required this.onLike,
    required this.replyCount,
    required this.openReplies,
    required this.closeReplies,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        IconButton(
          onPressed: onLike,
          icon: Icon(Icons.favorite_outline_rounded),
        ),

        TextButton(onPressed: onReply, child: Text('Responder')),
        if (replyCount > 0)
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              return AnimatedSize(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child:
                    viewModel.showReplies
                        ? (closeReplies!=null)?TextButton(
                          onPressed: closeReplies,
                          child: Text('Ocultar'),
                        ): SizedBox.shrink()
                        : TextButton(
                          onPressed: openReplies,
                          child: Text('$replyCount respostas'),
                        ),
              );
            },
          ),
      ],
    );
  }
}
