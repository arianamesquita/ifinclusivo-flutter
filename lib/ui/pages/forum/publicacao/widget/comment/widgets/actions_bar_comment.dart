import 'package:flutter/material.dart';

class ActionsBarComment extends StatelessWidget {
  final void Function()? onReply;
  final void Function()? onLike;
  final void Function()? openReplies;
  final void Function()? closeReplies;
  final bool showReplies;
  final int replyCount;

  const ActionsBarComment({
    super.key,
    required this.showReplies,
    required this.onReply,
    required this.onLike,
    required this.replyCount,
    required this.openReplies,
    required this.closeReplies,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        IconButton(
          onPressed: onLike,
          icon: Icon(Icons.favorite_outline_rounded),
        ),

        TextButton(onPressed: onReply, child: Text('Responder')),
        if (replyCount > 0)
          AnimatedSize(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            child:
                showReplies
                    ? (closeReplies!=null)?TextButton(
                      onPressed: closeReplies,
                      child: Text('Ocultar'),
                    ): SizedBox.shrink()
                    : TextButton(
                      onPressed: openReplies,
                      child: Text('$replyCount respostas'),
                    ),
          ),
      ],
    );
  }
}
