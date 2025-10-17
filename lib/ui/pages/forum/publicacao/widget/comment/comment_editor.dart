import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../../../utils/forum_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentEditor extends StatefulWidget {
  final Future<void> Function(String text) onSubmit;
  final ValueNotifier<bool>? clearNotifier;
  final VoidCallback? onCancel;
  final bool isLoading;
  final String? initialText;
  final bool isEditing;
  final String? imgPath;

  const CommentEditor.add({
    super.key,
    required this.onSubmit,
    this.onCancel,
    this.isLoading = false,
    this.clearNotifier,
    this.imgPath,
  }) : initialText = null,
       isEditing = false;

  /// Construtor para **edição** de comentário existente
  const CommentEditor.edit({
    super.key,
    required this.onSubmit,
    this.onCancel,
    this.isLoading = false,
    required this.initialText,
    this.clearNotifier,
    this.imgPath,
  }) : isEditing = true;

  @override
  State<CommentEditor> createState() => _CommentEditorState();
}

class _CommentEditorState extends State<CommentEditor> {
  late final QuillController _quillController;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  bool _showToolbar = false;
  bool _pinToolbar = false;
  bool _showActionsButtons = false;
  bool _isTextValid = false;
  bool _isTooLong = false;
  static const int maxLength = 1500;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.initialText != null) {
      _quillController = QuillController(
        document: loadDocument(text: widget.initialText!),
        selection: const TextSelection.collapsed(offset: 0),
      );
    } else {
      _quillController = QuillController.basic();
    }
    _quillController.addListener(_handleSelectionChange);
    _quillController.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);
    widget.clearNotifier?.addListener(() {
      _handlerClean();
    });
  }

  void _handlerClean() {
    if (widget.clearNotifier!.value) {
      _quillController.clear();
      FocusScope.of(context).unfocus();
      setState(() {
        _showActionsButtons = false;
        _showToolbar = false;
      });
      widget.clearNotifier!.value = false;
    }
  }

  @override
  void dispose() {
    _quillController.removeListener(_handleSelectionChange);
    _quillController.removeListener(_handleTextChange);
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    final text = _quillController.document.toPlainText().trim();
    final isEmpty = text.isEmpty;
    final tooLong = text.length > maxLength;

    setState(() {
      _isTextValid = !isEmpty && !tooLong;
      _isTooLong = tooLong;
    });
  }

  void _handleSelectionChange() {
    final selection = _quillController.selection;
    final hasSelection = selection.baseOffset != selection.extentOffset;

    if (hasSelection != _showToolbar) {
      setState(() {
        _showToolbar = hasSelection;
      });
    }
  }

  Future<void> _handleComment() async {
    final plainText = _quillController.document.toPlainText().trim();
    if (plainText.isEmpty) return;

    final textDelta = jsonEncode(_quillController.document.toDelta().toJson());
    await widget.onSubmit(textDelta);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus && !_showActionsButtons) {
      setState(() => _showActionsButtons = true);
    }
  }

  void _handleCancel() {
    widget.onCancel?.call();
    _quillController.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _showActionsButtons = false;
      _showToolbar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        CircleAvatar(
          backgroundImage:
              (widget.imgPath != null && widget.imgPath!.isNotEmpty)
                  ? NetworkImage(widget.imgPath!)
                  : null,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerLowest,
                  boxShadow: [
                    BoxShadow(
                      color:
                          _isTooLong
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.outline,
                      spreadRadius: 0.1,
                      blurRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                  border: BoxBorder.all(
                    width: 1,
                    color:
                        _isTooLong
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                      child:
                          (_showToolbar || _pinToolbar)
                              ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                child: Row(
                                  children: [
                                    AnimatedSize(
                                      duration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      curve: Curves.easeInOut,
                                      child:
                                          _pinToolbar
                                              ? IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _pinToolbar = !_pinToolbar;
                                                  });
                                                },
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .thumbtackSlash,
                                                  size: 18,
                                                ),
                                              )
                                              : IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _pinToolbar = !_pinToolbar;
                                                  });
                                                },
                                                icon: FaIcon(
                                                  FontAwesomeIcons.thumbtack,
                                                  size: 18,
                                                ),
                                              ),
                                    ),

                                    QuillSimpleToolbar(
                                      controller: _quillController,
                                      config: QuillSimpleToolbarConfig(
                                        showFontFamily: false,
                                        showUndo: false,
                                        showRedo: false,
                                        showSubscript: false,
                                        showSuperscript: false,
                                        showSearchButton: false,
                                        showAlignmentButtons: false,
                                        showListCheck: false,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.outline,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox.shrink(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10,
                      ),
                      child: QuillEditor.basic(
                        controller: _quillController,
                        focusNode: _focusNode,
                        config: QuillEditorConfig(
                          placeholder: 'Adicione um comentário...',
                          minHeight: 25,
                          maxHeight: 200,
                          customStyles: DefaultStyles(
                            placeHolder: DefaultTextBlockStyle(
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.7),
                              ),
                              HorizontalSpacing.zero,
                              VerticalSpacing.zero,
                              VerticalSpacing.zero,
                              null,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_isTooLong)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                        child: Text(
                          'Limite de caracteres excedido',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child:
                    _showActionsButtons
                        ? Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 15,
                            children: [
                              FilledButton(
                                onPressed: _handleCancel,
                                style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.error,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onError,
                                ),
                                child: Text('Cancelar'),
                              ),
                              FilledButton(
                                onPressed:
                                    widget.isLoading || !_isTextValid
                                        ? null
                                        : _handleComment,
                                style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                child:
                                    widget.isLoading
                                        ? const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(),
                                        )
                                        : Text(
                                          widget.isEditing
                                              ? "Salvar"
                                              : "Comentar",
                                        ),
                              ),
                            ],
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
