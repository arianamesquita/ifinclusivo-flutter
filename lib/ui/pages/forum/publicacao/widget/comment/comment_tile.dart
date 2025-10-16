import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_editor.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/viewmodels/comment_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/widgets/comment_content.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/widgets/replies_list_comment.dart';
import 'package:provider/provider.dart';

import '../../../../../../utils/forum_utils.dart';

class CommentTile extends StatefulWidget {
  final int commentId;
  final int publicationId;
  final int? userMark;
  final String userName;
  final int autorId;
  final String? taggedUser;
  final DateTime dateCreation;
  final int replyCount;
  final String publicationText;
  final CommentViewModel? viewModel;
  final bool showChildrenTree;
  const CommentTile({
    super.key,
    this.viewModel,
    required this.userName,
    required this.taggedUser,
    required this.dateCreation,
    required this.replyCount,
    required this.publicationText,
    required this.commentId,
    required this.publicationId,
    required this.autorId,
    this.userMark,
  }) : showChildrenTree = true;

  const CommentTile.noTree({
    super.key,
    this.viewModel,
    required this.userName,
    required this.taggedUser,
    required this.dateCreation,
    required this.replyCount,
    required this.commentId,
    required this.publicationText,
    required this.publicationId,
    required this.autorId,
    this.userMark,
  }) : showChildrenTree = false;
  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  late final QuillController _controller;
  bool _showReply = false;
  late CommentViewModel _viewModel;
  bool _editTile = false;
  final ValueNotifier<bool> _clearEditorNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    if (widget.viewModel != null) {
      _viewModel = widget.viewModel!;
    } else {
      _viewModel = CommentViewModel(
        forumRepository: context.read(),
        authRepository: context.read(),
      );
    }

    _controller = QuillController(
      document: loadDocument(text: widget.publicationText),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    _viewModel.addCommentCommand.addListener(_onAddCommentChanged);
  }

  void _onAddCommentChanged() {
    final cmd = _viewModel.addCommentCommand;
    if (cmd.value.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Comentário adicionado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      _clearEditorNotifier.value = true;
      _viewModel.addCommentCommand.reset();
      setState(() {
        _showReply = false;
      });
    } else if (cmd.value.isFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao adicionar comentário.'),
          backgroundColor: Colors.red,
        ),
      );
      _viewModel.addCommentCommand.reset();
    }
  }

  @override
  void dispose() {
    _viewModel.addCommentCommand.removeListener(_onAddCommentChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeInBack,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.1),
          end: Offset.zero,
        ).animate(animation);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
      child:
          _editTile
              ? CommentEditor.edit(
                onSubmit: _sendEdite,
                onCancel: () {
                  setState(() {
                    _editTile = false;
                  });
                },
                initialText: widget.publicationText,
              )
              : Column(
                children: [
                  ListenableBuilder(
                    listenable: _viewModel,
                    builder: (context, _) {
                      final menuItems = _getMenuItems();

                      return CommentContent(
                        controller: _controller,
                        showReplyWidget: _showReply,
                        userName: widget.userName,
                        dateCreation: widget.dateCreation,
                        menuItems: menuItems,
                        taggedUser: widget.taggedUser,
                        viewModel: _viewModel,
                        onReply: () {
                          setState(() {
                            _showReply = !_showReply;
                          });
                        },
                        onLike: () {},
                        replyCount: widget.replyCount,
                        openReplies: () {
                          _viewModel.fetchReplies(commentId: widget.commentId);
                          _viewModel.toggleReplies();
                        },
                        closeReplies:
                            widget.showChildrenTree
                                ? () {
                                  _viewModel.cleanReplies();
                                }
                                : null,
                      );
                    },
                  ),

                  ListenableBuilder(
                    listenable: _viewModel.addCommentCommand,
                    builder: (context, _) {
                      return AnimatedSize(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        child:
                            _showReply
                                ? Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CommentEditor.add(
                                    onSubmit: _sendReply,
                                    clearNotifier: _clearEditorNotifier,
                                    isLoading:
                                        _viewModel
                                            .addCommentCommand
                                            .value
                                            .isRunning,
                                    onCancel: () {
                                      setState(() {
                                        _showReply = false;
                                      });
                                    },
                                  ),
                                )
                                : SizedBox.shrink(),
                      );
                    },
                  ),

                  if (widget.showChildrenTree)
                    ListenableBuilder(
                      listenable: _viewModel,
                      builder: (context, _) {
                        return RepliesListComment(
                          viewModel: _viewModel,
                          commentId: widget.commentId,
                          userMark: widget.autorId,
                        );
                      },
                    ),
                ],
              ),
    );
  }

  Future<void> _sendReply(String text) async {
    _viewModel.addCommentCommand.execute(
      widget.publicationId,
      ComentarioRequestModel(
        parentId: widget.commentId,
        texto: text,
        usuarioMencionadoId: widget.userMark,
      ),
    );
  }
  Future<void> _sendEdite(String text) async {
    _viewModel.addCommentCommand.execute(
      widget.publicationId,
      ComentarioRequestModel(
        parentId: widget.commentId,
        texto: text,
        usuarioMencionadoId: widget.userMark,
      ),
    );
  }

  List<PopupMenuItem<String>> _getMenuItems() {
    return (_viewModel.currentUser != null &&
            _viewModel.currentUser!.id == widget.autorId)
        ? [
          PopupMenuItem(
            value: "Editar",
            child: Text("Editar"),
            onTap: () {
              setState(() {
                _editTile = true;
              });
            },
          ),
          PopupMenuItem(value: "Excluir", child: Text("Excluir"), onTap: () {}),
        ]
        : [
          PopupMenuItem(
            value: "denunciar",
            child: Text("Denunciar"),
            onTap: () {},
          ),
        ];
  }
}
