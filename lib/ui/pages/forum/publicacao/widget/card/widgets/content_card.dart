import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';

class ContentCard extends StatefulWidget {
  final String title;
  final String contentJson;
  final void Function()? onPressed;

  const ContentCard({
    super.key,
    required this.title,
    required this.contentJson,
    required this.onPressed,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  late final QuillController _controller;
  final GlobalKey _editorKey = GlobalKey();
  bool _showSeeMore = false;

  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: _loadDocument(),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    // Espera o primeiro frame para medir o tamanho
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfExceeds();
    });
  }

  Document _loadDocument() {
    try {
      final List<dynamic> jsonData = jsonDecode(widget.contentJson);
      return Document.fromJson(jsonData);
    } catch (e) {
      return Document()..insert(0, 'Erro ao carregar conteúdo.');
    }
  }

  void _checkIfExceeds() {
    final context = _editorKey.currentContext;
    if (context != null) {
      final size = context.size;
      if (size != null && size.height > 195) {
        setState(() => _showSeeMore = true);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ClipRect(
                  child: IgnorePointer(
                    ignoring: false,
                    child: QuillEditor.basic(
                      key: _editorKey,
                      controller: _controller,
                      config: const QuillEditorConfig(
                        autoFocus: false,
                        padding: EdgeInsets.symmetric(vertical: 2),
                        scrollable: false,
                        showCursor: false,
                        enableSelectionToolbar: false,
                      ),
                    ),
                  ),
                ),
              ),
              if (_showSeeMore) _buildFadeAndButton(context, widget.onPressed),
            ],
          ),
        ],
      ),
    );
  }
}


  // Widget para o degradê e o botão "Ver mais"
  Widget _buildFadeAndButton(BuildContext context,onPressed) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.surfaceContainerLow.withValues(alpha: 0.0),
            Theme.of(context).colorScheme.surfaceContainerLow,
          ],
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: _buildToggleButton(onPressed),
    );
  }

  Widget _buildToggleButton(onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Text('Ver mais'),
          Icon(Icons.unfold_more, size: 20),
        ],
      ),
    );
  }

