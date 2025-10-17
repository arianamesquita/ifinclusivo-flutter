import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/viewmodels/publicacao_viewmodel.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/comment_editor.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/widgets/comment_content.dart';
import 'package:if_inclusivo/ui/pages/forum/publicacao/widget/comment/widgets/replies_list_comment.dart';
import 'package:result_command/result_command.dart';
import '../../../../../../utils/forum_utils.dart';

class CommentTile extends StatefulWidget {
  final int commentId;
  final int publicationId;
  final int? parentId;
  final int? userMark;
  final String userName;
  final String imgPath;
  final int autorId;
  final String? taggedUser;
  final int? taggedId;
  final DateTime dateCreation;
  final int replyCount;
  final String publicationText;
  final PublicacaoViewModel viewModel;
  final bool showChildrenTree;

  const CommentTile({
    super.key,
    required this.viewModel,
    required this.userName,
    required this.taggedUser,
    required this.dateCreation,
    required this.replyCount,
    required this.publicationText,
    required this.commentId,
    required this.publicationId,
    required this.autorId,
    this.userMark,
    this.parentId,
    this.taggedId, required this.imgPath,
  }) : showChildrenTree = true;

  const CommentTile.noTree({
    super.key,
    required this.viewModel,
    required this.userName,
    required this.taggedUser,
    required this.dateCreation,
    required this.replyCount,
    required this.commentId,
    required this.publicationText,
    required this.publicationId,
    required this.autorId,
    this.userMark,
    this.parentId,
    this.taggedId, required this.imgPath,
  }) : showChildrenTree = false;
  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  late final QuillController _controller;
  bool _showReply = false;
  late PublicacaoViewModel _viewModel;
  bool _editTile = false;
  final ValueNotifier<bool> _clearEditorNotifier = ValueNotifier(false);
  final ValueNotifier<bool> _clearEditorUpdateNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;

    _controller = QuillController(
      document: loadDocument(text: widget.publicationText),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode != null) {
      commentNode.addCommand.addListener(_onAddCommentChanged);
      commentNode.updateCommand.addListener(_onUpdatedCommentChanged);
    }
  }

  void _onAddCommentChanged() {
    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode == null) return;

    final cmd = commentNode.addCommand;

    switch (cmd.value) {
      case FailureCommand<ComentarioResponseModel>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao adicionar comentário.'),
            backgroundColor: Colors.red,
          ),
        );
        commentNode.addCommand.reset();
        break;
      case SuccessCommand<ComentarioResponseModel>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Comentário adicionado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        _clearEditorNotifier.value = true;

        setState(() {
          _showReply = false;
        });
        commentNode.addCommand.reset();
        break;
      case IdleCommand<ComentarioResponseModel>():
      case CancelledCommand<ComentarioResponseModel>():
      case RunningCommand<ComentarioResponseModel>():
        return;
    }
  }

  void _onUpdatedCommentChanged() {
    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode == null) return;

    final cmd = commentNode.updateCommand;
    switch (cmd.value) {
      case IdleCommand<ComentarioResponseModel>():
      case CancelledCommand<ComentarioResponseModel>():
      case RunningCommand<ComentarioResponseModel>():
        return;
      case FailureCommand<ComentarioResponseModel>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao adicionar comentário.'),
            backgroundColor: Colors.red,
          ),
        );
        commentNode.updateCommand.reset();
        break;
      case SuccessCommand<ComentarioResponseModel>(:final value):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Comentário adicionado com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );
        _clearEditorUpdateNotifier.value = true;

        setState(() {
          _controller.document = loadDocument(text: value.texto);
          _editTile = false;
        });
        commentNode.updateCommand.reset();
        break;
    }
  }

  @override
  void dispose() {
    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode != null) {
      commentNode.addCommand.removeListener(_onAddCommentChanged);
      commentNode.updateCommand.removeListener(_onUpdatedCommentChanged);
    }

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
              ? (_viewModel.findCommentById(widget.commentId) != null)
                  ? ListenableBuilder(
                    listenable:
                        _viewModel
                            .findCommentById(widget.commentId)!
                            .updateCommand,
                    builder: (context, _) {
                      return CommentEditor.edit(
                        imgPath: widget.imgPath,
                        onSubmit: _sendEdite,
                        isLoading:
                            _viewModel
                                .findCommentById(widget.commentId)!
                                .updateCommand
                                .value
                                .isRunning,
                        onCancel: () {
                          setState(() {
                            _editTile = false;
                          });
                        },
                        clearNotifier: _clearEditorUpdateNotifier,
                        initialText: widget.publicationText,
                      );
                    },
                  )
                  : Center(
                    child: Text(
                      'Error Inesperado, Tente Atualizar a Pagina Caso o error persista entre em contato com o suporte',
                    ),
                  )
              : ListenableBuilder(
                listenable: _viewModel,
                builder: (context, _) {
                  final commentNode = _viewModel.findCommentById(
                    widget.commentId,
                  );
                  if (commentNode == null) {
                    return Center(
                      child: Text(
                        'Error Inesperado, Tente Atualizar a Pagina Caso o error persista entre em contato com o suporte',
                      ),
                    );
                  }
                  final menuItems = _getMenuItems();
                  return Column(
                    children: [
                      CommentContent(
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
                        replyCount: commentNode.comment.totalRespostas,
                        openReplies: () async {
                          await _viewModel.toggleReplies(widget.commentId);
                        },
                        closeReplies:
                            widget.showChildrenTree
                                ? () async {
                                  await _viewModel.toggleReplies(
                                    widget.commentId,
                                  );
                                }
                                : null,
                        showReplies: commentNode.showReplies, imgPath: widget.imgPath,
                      ),
                      ListenableBuilder(
                        listenable: commentNode.addCommand,
                        builder: (context, _) {
                          return AnimatedSize(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                            child:
                                _showReply
                                    ? Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: CommentEditor.add(
                                        imgPath: widget.imgPath,
                                        onSubmit: _sendReply,
                                        clearNotifier: _clearEditorNotifier,
                                        isLoading:
                                            commentNode
                                                .addCommand
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
                  );
                },
              ),
    );
  }

  Future<void> _sendReply(String text) async {
    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode == null) return;
    commentNode.addCommand.execute(
      widget.publicationId,
      ComentarioRequestModel(
        parentId: widget.parentId,
        texto: text,
        usuarioMencionadoId: widget.userMark,
      ),
    );
  }

  Future<void> _sendEdite(String text) async {
    final commentNode = _viewModel.findCommentById(widget.commentId);
    if (commentNode == null) return;
    await commentNode.updateCommand.execute(
      widget.commentId,
      ComentarioRequestModel(
        parentId: widget.parentId,
        texto: text,
        usuarioMencionadoId: widget.taggedId,
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
          PopupMenuItem(
            value: "Excluir",
            child: Text("Excluir"),
            onTap: () {
              _viewModel.deleteCommentsCommand.execute(widget.commentId);
            },
          ),
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
