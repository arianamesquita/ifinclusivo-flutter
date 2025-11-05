import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/domain/validators/word_suggestion_validator.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/viewModels/word_suggestion_view_model.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/libras_custom_text_field.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/sent_suggestion_page.dart';
import 'package:result_command/result_command.dart';

import '../../../../domain/models/enums/status.dart';
import '../../../core/layout/custom_container_shell.dart';
import '../libras_page/widgets/top_content_libras.dart';

class WordSuggestionPage extends StatefulWidget {
  const WordSuggestionPage({super.key, required this.viewModel});
  final WordSuggestionViewModel viewModel;

  @override
  State<WordSuggestionPage> createState() => _WordSuggestionPageState();
}

class _WordSuggestionPageState extends State<WordSuggestionPage> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _reasonController = TextEditingController();
  final _linkController = TextEditingController();
  WordSuggestion _wordSuggestion = WordSuggestion.empty();
  final WordSuggestionValidator _validator = WordSuggestionValidator();

  _validateForm() => _validator.validate(_wordSuggestion).isValid;

  @override
  void initState() {
    widget.viewModel.saveWordCmd.addListener(_handlerSaveSuggestion);
    super.initState();
  }

  @override
  void dispose() {
    widget.viewModel.saveWordCmd.removeListener(_handlerSaveSuggestion);
    _wordController.dispose();
    _reasonController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  _handlerSaveSuggestion() {
    final cmd = widget.viewModel.saveWordCmd;
    final value = cmd.value;
    switch (value) {
      case FailureCommand<LibrasResponseModel>():
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(value.error.toString())));
        cmd.reset();
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.saveWordCmd,
      builder: (context, _) {
        if (widget.viewModel.saveWordCmd.value.isSuccess) {
          _formKey.currentState?.reset();
          _wordSuggestion = WordSuggestion.empty();
          _wordController.clear();
          _reasonController.clear();
          _linkController.clear();
          return SentSuggestionPage(
            onPressed: widget.viewModel.saveWordCmd.reset,
          );
        }
        return CustomContainerShell(
          child: SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: TopContentLibras(title: "CONVERTE LIBRAS")),
                  Text(
                    "Sugerir uma nova palavra",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(
                      "Sua contribuição ajuda a nossa comunidade a crescer!\nPreencha os campos abaixo para nos enviar sua sugestão.",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    onChanged: _validateForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LibrasCustomTextField(
                          label: "Palavra ou termo",
                          hintText: "Ex: Inteligência Artificial, JavaScript, API",
                          controller: _wordController,
                          validator: _validator.byField(
                            _wordSuggestion,
                            "word",
                          ),
                          onChanged: _wordSuggestion.setWord,
                        ),
                        LibrasCustomTextField(
                          label: "Porque esta palavra é importante?",
                          hintText:
                              "Ex: É um termo muito comum na área de desenvolvimento e ainda não possui um sinal conhecido.",
                          controller: _reasonController,
                          validator: _validator.byField(
                            _wordSuggestion,
                            "reason",
                          ),
                          onChanged: _wordSuggestion.setReason,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(Icons.play_circle, color: Color(0xFFA60F13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                "Link de vídeo do Youtube (opcional)",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                        LibrasCustomTextField(
                          label: "Se você conhece um vídeo que demonstre o sinal, nos ajude colando o link.",
                          hintText: "Cole o link do vídeo aqui",
                          controller: _linkController,
                          onChanged: _wordSuggestion.setLink,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Icon(
                                  Icons.videocam_outlined,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: Text(
                                  "Vídeo do sinal (opcional)",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Botão de vídeo pressionado!",
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.white,
                                  elevation: 6,
                                  highlightElevation: 10,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                              Text(
                                "Formatos aceitos: mp4, WebM\nDuração máxima: 2 minutos",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF79757F),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              child: ElevatedButton(
                                onPressed:
                                    widget.viewModel.saveWordCmd.value.isRunning
                                        ? null
                                        : () {
                                          if (_formKey.currentState!.validate() &&
                                              _validateForm()) {
                                            widget.viewModel.saveWordCmd.execute(
                                              LibrasRequestModel(
                                                palavra: _wordSuggestion.word,
                                                descricao: _wordSuggestion.reason,
                                                url: _wordSuggestion.link,
                                                status: Status.EMANALISE,
                                                categorias:
                                                    Categorias.BANCO_DE_DADOS,
                                              ),
                                            );
                                          }
                                        },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF2B7A62),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child:
                                    widget.viewModel.saveWordCmd.value.isRunning
                                        ? const CircularProgressIndicator()
                                        : Text(
                                          "Sugerir palavra",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          ),
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
          ),
        );
      },
    );
  }
}
