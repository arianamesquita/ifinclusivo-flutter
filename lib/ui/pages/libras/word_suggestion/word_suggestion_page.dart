import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/models/enums/categorias.dart';
import 'package:if_inclusivo/domain/validators/word_suggestion_validator.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/viewModels/word_suggestion_view_model.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/libras_custom_text_field.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/sent_suggestion_page.dart';
import 'package:result_command/result_command.dart';
import 'package:video_player/video_player.dart';
import 'dart:html' as html;

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
  File? _selectedVideo; // usado em mobile
  Uint8List? _selectedVideoBytes; // usado no web
  String? _selectedVideoName; // nome do arquivo
  String? _videoPreviewUrl; // para mostrar preview no web
  Duration? _videoDuration;

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
    if (kIsWeb && _videoPreviewUrl != null) {
      html.Url.revokeObjectUrl(_videoPreviewUrl!);
    }
    super.dispose();
  }

  _handlerSaveSuggestion() {
    final cmd = widget.viewModel.saveWordCmd;
    final value = cmd.value;
    switch (value) {
      case FailureCommand<LibrasResponseModel>():
        print(value.error.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(value.error.toString())));
        cmd.reset();
        break;
      default:
        return;
    }
  }
  void _resetForm() {
    _formKey.currentState?.reset();
    _wordSuggestion = WordSuggestion.empty();
    _wordController.clear();
    _reasonController.clear();
    _linkController.clear();

    // Limpa vídeo selecionado (mobile e web)
    if (kIsWeb) {
      if (_videoPreviewUrl != null) {
        html.Url.revokeObjectUrl(_videoPreviewUrl!);
      }
      _videoPreviewUrl = null;
      _selectedVideoBytes = null;
      _selectedVideoName = null;
    } else {
      _selectedVideo = null;
    }

    _videoDuration = null;

  }
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.saveWordCmd,
      builder: (context, _) {
        if (widget.viewModel.saveWordCmd.value.isSuccess) {
          _resetForm();
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
                          hintText:
                              "Ex: Inteligência Artificial, JavaScript, API",
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
                              child: Icon(
                                Icons.play_circle,
                                color: Color(0xFFA60F13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Text(
                                "Link de vídeo do Youtube (opcional)",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                        LibrasCustomTextField(
                          label:
                              "Se você conhece um vídeo que demonstre o sinal, nos ajude colando o link.",
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
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
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
                                  onPressed: _pickVideo,

                                  backgroundColor: Colors.white,
                                  elevation: 6,
                                  highlightElevation: 10,
                                  child: Icon(
                                    _selectedVideo == null &&
                                        _selectedVideoBytes == null
                                        ? Icons.add
                                        : Icons.check,
                                    color:
                                    _selectedVideo == null &&
                                        _selectedVideoBytes == null
                                            ? Colors.black
                                            : Colors.green,
                                    size: 28,
                                  ),
                                ),
                              ),
                              Text(
                                // Verifica se qualquer um dos seletores está nulo
                                _selectedVideo == null &&
                                        _selectedVideoBytes == null
                                    ? "Formatos aceitos: MP4, WebM\nDuração máxima: 3 minutos"
                                    // Usa a variável correta dependendo da plataforma
                                    : "Vídeo selecionado: ${kIsWeb ? _selectedVideoName : _selectedVideo!.path.split('/').last}\nDuração: ${_videoDuration?.inSeconds ?? 0}s",
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
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              _validateForm()) {
                                            widget.viewModel.saveWordCmd
                                                .execute(
                                              SugereLibrasUploadModel(
                                                data: SugereLibrasModel(
                                                  palavra: _wordSuggestion.word,
                                                  descricao: _wordSuggestion.reason,
                                                  url: _wordSuggestion.link,
                                                ),

                                                videoFile: _selectedVideo,
                                                videoBytes: _selectedVideoBytes,
                                                videoName: _selectedVideoName,
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

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'webm'],
      withData: kIsWeb, // true no web para pegar bytes
    );

    if (result == null) return;

    VideoPlayerController controller;
    Duration duration;

    if (kIsWeb) {
      // ----- 🕸️ WEB -----
      final fileBytes = result.files.single.bytes!;
      final blob = html.Blob([fileBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      controller = VideoPlayerController.network(url);
      await controller.initialize();
      duration = controller.value.duration;
      await controller.dispose(); // <-- DESCARTE O CONTROLLER AQUI

      if (duration > const Duration(minutes: 3)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('O vídeo deve ter no máximo 3 minutos.'),
          ),
        );
        html.Url.revokeObjectUrl(url); // Libera o blob se falhar
        return;
      }

      // Se já existia um vídeo, revoga o URL antigo
      if (_videoPreviewUrl != null) {
        html.Url.revokeObjectUrl(_videoPreviewUrl!);
      }

      setState(() {
        _selectedVideoBytes = fileBytes;
        _selectedVideoName = result.files.single.name;
        _videoPreviewUrl = url; // Armazena o novo URL
        _videoDuration = duration;
        _selectedVideo = null; // Garante que o modo mobile esteja limpo
      });
    } else {
      // ----- 📱 MOBILE / DESKTOP -----
      final path = result.files.single.path;
      if (path == null) return;

      final file = File(path);
      controller = VideoPlayerController.file(file);
      await controller.initialize();
      duration = controller.value.duration;
      await controller.dispose(); // Já estava correto aqui

      if (duration > const Duration(minutes: 3)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('O vídeo deve ter no máximo 3 minutos.'),
          ),
        );
        return;
      }

      setState(() {
        _selectedVideo = file;
        _videoDuration = duration;
        // Garante que o modo web esteja limpo
        _selectedVideoBytes = null;
        _selectedVideoName = null;
        _videoPreviewUrl = null;
      });
    }
  }
}
