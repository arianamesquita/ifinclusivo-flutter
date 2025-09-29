import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class PerguntaForm extends StatefulWidget {
  final TextEditingController perguntaController;
  final QuillController detalheController;
  const PerguntaForm({super.key, required this.perguntaController, required this.detalheController});
  @override
  State<PerguntaForm> createState() => _PerguntaFormState();
}

class _PerguntaFormState extends State<PerguntaForm> {




  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: widget.perguntaController,
            decoration: const InputDecoration(
              hintText: "Qual é a sua pergunta?",
              border: InputBorder.none,
            ),
          ),
        ),

        Column(
          spacing: 8,
          children: [
            QuillSimpleToolbar(
              controller: widget.detalheController,
              config: QuillSimpleToolbarConfig(
                showFontFamily: false,
                showUndo: false,
                showRedo: false,
                showSubscript: false,
                showSuperscript: false,
                showFontSize: false,
                showSearchButton: false,
                showAlignmentButtons: false,
                showListCheck: false,
                showHeaderStyle: false,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                  borderRadius: BorderRadius.circular(12)

                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: BoxBorder.all(color: Theme.of(context).colorScheme.outline)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                  child: QuillEditor.basic(
                  controller: widget.detalheController,
                  config: const QuillEditorConfig(
                    placeholder:
                    'Explique seu problema ou dúvida com mais detalhes...',
                    minHeight: 200,
                    maxHeight: 500,

                  ),

                                    ),
                ),),
            ),
          ],
        ),
      ],
    );
  }


}
