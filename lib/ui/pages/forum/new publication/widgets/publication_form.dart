import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class PublicationForm extends StatelessWidget {
  final TextEditingController titleController;
  final QuillController bodyController;
  final String? errorTitle;
  final String? errorBody;
  final FocusNode focusTitle;
  final FocusNode focusBody;
  const PublicationForm({
    super.key,
    required this.titleController,
    required this.bodyController,
    this.errorTitle,
    this.errorBody,
    required this.focusTitle,
    required this.focusBody,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Titulo da Publicação:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              TextField(
                focusNode: focusTitle,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Qual é a sua pergunta?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: errorTitle,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Assunto da Publicação:',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      (errorBody != null)
                          ? Theme.of(context).colorScheme.surface
                          : null,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow:
                      (errorBody != null)
                          ? [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.error,
                              spreadRadius: 0.1,
                              blurRadius: 1,
                            ),
                          ]
                          : null,
                  border: BoxBorder.all(
                    color:
                        (errorBody != null)
                            ? Theme.of(context).colorScheme.error
                            : (focusBody.hasFocus)
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                    width: (focusBody.hasFocus)?2:1
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          QuillSimpleToolbar(
                            controller: bodyController,
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
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8, bottom: 12),
                      child: QuillEditor.basic(
                        controller: bodyController,
                        focusNode: focusBody,
                        config:  QuillEditorConfig(
                          placeholder:
                              'Explique seu problema ou dúvida com mais detalhes...',
                          maxHeight: 500,
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

                  ],
                ),
              ),
            ],
          ),
        ),
        if (errorBody != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            child: Text(
              errorBody!,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
