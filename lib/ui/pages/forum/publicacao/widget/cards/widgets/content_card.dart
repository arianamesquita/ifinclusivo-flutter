import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter_quill/flutter_quill.dart';

class ContentCard extends StatefulWidget {
  final String title;
  final String contentJson;

  const ContentCard({
    super.key,
    required this.title,
    required this.contentJson,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  late final QuillController _controller;
  bool _isExpanded = false;
  final double _collapsedHeight = 150.0;

  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: _loadDocument(),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,

    );
  }

  Document _loadDocument() {
    try {
      final List<dynamic> jsonData = jsonDecode(widget.contentJson);
      return Document.fromJson(jsonData);
    } catch (e) {
      print('Erro ao carregar o documento Quill: $e');
      return Document()..insert(0, 'Erro ao carregar conteúdo.');
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: _isExpanded ? null : _collapsedHeight,
                child: ClipRect(
                  child: QuillEditor.basic(
                    controller: _controller,
                    config: QuillEditorConfig(
                      autoFocus: false,
                      expands: false, // Não expande infinitamente
                      padding: EdgeInsets.zero,
                      showCursor: false,
                      enableSelectionToolbar: true,
                    ),
                  ),
                ),
              ),

              if (!_isExpanded)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildFadeAndButton(context),
                ),
            ],
          ),
          if (_isExpanded)
            _buildToggleButton(),
        ],
      ),
    );
  }

  // Widget para o degradê e o botão "Ver mais"
  Widget _buildFadeAndButton(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).cardColor.withOpacity(0.0),
            Theme.of(context).cardColor,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: _buildToggleButton(),
    );
  }

  Widget _buildToggleButton() {
    return TextButton(
      onPressed: () => setState(() => _isExpanded = !_isExpanded),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_isExpanded ? 'Ver menos' : 'Ver mais'),
          const SizedBox(width: 4),
          Icon(_isExpanded ? Icons.unfold_less : Icons.unfold_more, size: 20),
        ],
      ),
    );
  }
}