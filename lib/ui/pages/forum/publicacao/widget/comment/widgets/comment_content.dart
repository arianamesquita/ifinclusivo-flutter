import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/widgets/user_info_comment.dart';

import '../viewmodels/comment_viewmodel.dart';
import 'actions_bar_comment.dart';

class CommentContent extends StatelessWidget {
  final String userName;
  final String? taggedUser;
  final DateTime dateCreation;
  final List<PopupMenuEntry<dynamic>> menuItems;
  final CommentViewModel viewModel;
  final void Function()? onReply;
  final void Function()? onLike;
  final void Function()? openReplies;
  final void Function()? closeReplies;
  final int replyCount;
  final QuillController controller;
  final bool showReplyWidget;

  const CommentContent({
    super.key,
    required this.userName,
    this.taggedUser,
    required this.dateCreation,
    required this.menuItems,
    required this.viewModel,
    this.onReply,
    this.onLike,
    this.openReplies,
    this.closeReplies,
    required this.replyCount,
    required this.controller,
    required this.showReplyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CircleAvatar(),
              Expanded(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  child:
                      showReplyWidget
                          ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: VerticalDivider(),
                          )
                          : SizedBox.shrink(),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoComment(
                        userName: userName,
                        dateCreation: dateCreation,
                        taggedUser: taggedUser,
                      ),
                      QuillEditor.basic(
                        controller: controller,
                        config: const QuillEditorConfig(
                          autoFocus: false,
                          padding: EdgeInsets.zero,
                          scrollable: false,
                          showCursor: false,
                          enableSelectionToolbar: false,
                        ),
                      ),
                    ],
                  ),
                ),
                ActionsBarComment(
                  viewModel: viewModel,
                  onReply: onReply,
                  onLike: onLike,
                  replyCount: replyCount,
                  openReplies: openReplies,
                  closeReplies: closeReplies,
                ),
              ],
            ),
          ),
          Column(
            children: [
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => menuItems,
              ),
            ],
          ),
        ],

      ),
    );
  }
}
