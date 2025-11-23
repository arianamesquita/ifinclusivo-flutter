import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/request/gen_requests.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/domain/validators/word_suggestion_validator.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/viewModels/word_suggestion_view_model.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/libras_custom_text_field.dart';
import 'package:if_inclusivo/ui/pages/libras/word_suggestion/widgets/sent_suggestion_page.dart';
import 'package:if_inclusivo/utils/responsive_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:result_command/result_command.dart';
import 'package:video_player/video_player.dart';
import '../../../core/layout/custom_container_shell.dart';
import '../libras_details/widgets/top_content_libras.dart';

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
  XFile? _selectedVideoFile;// usado em mobile
  Uint8List? _selectedVideoBytes; // usado no web
  String? _selectedVideoName; // nome do arquivo
  bool _loadigFile = false;

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
      _selectedVideoBytes = null;
      _selectedVideoName = null;
    } else {
      _selectedVideoFile = null;
    }

  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;
    return ListenableBuilder(
      listenable: widget.viewModel.saveWordCmd,
      builder: (context, _) {
        if (widget.viewModel.saveWordCmd.value.isSuccess) {
          _resetForm();
          return SentSuggestionPage(
            onPressed: widget.viewModel.saveWordCmd.reset,
          );
        }
        return isMobile?
            Scaffold(
        appBar: AppBar(title: Text('Sugerir uma nova palavra'),),
        body:SafeArea(child: _buildSingleChildScrollView(context)) ,
        )
            :CustomContainerShell(
          child: _buildSingleChildScrollView(context),
        );
      },
    );
  }

  SingleChildScrollView _buildSingleChildScrollView(BuildContext context) {
    final isMobile = ResponsiveUtils.getDeviceType(context) == DeviceScreenType.mobile;

    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ResponsiveUtils.centralized(
              context: context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(!isMobile)
                  Center(child: TopContentLibras(title: "CONVERTE LIBRAS")),
                  if(!isMobile)
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
                                  onPressed:_loadigFile? null : () async {
                                    if( _selectedVideoFile != null ||
                                        _selectedVideoBytes != null){
                                      setState(() {
                                        _selectedVideoFile = null;
                                        _selectedVideoBytes = null;
                                      });
                                    }else {
                                      await _pickVideo();
                                    }},

                                  backgroundColor: Colors.white,
                                  elevation: 6,
                                  highlightElevation: 10,
                                  child:_loadigFile? CircularProgressIndicator() :Icon(
                                    _selectedVideoFile == null &&
                                            _selectedVideoBytes == null
                                        ? Icons.add
                                        : Icons.check,
                                    color:
                                    _selectedVideoFile == null &&
                                                _selectedVideoBytes == null
                                            ? Colors.black
                                            : Colors.green,
                                    size: 28,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  // Verifica se qualquer um dos seletores está nulo
                                  _selectedVideoFile == null &&
                                          _selectedVideoBytes == null
                                      ? "Formatos aceitos: MP4, WebM\nTamanho máximo: 50 mb"
                                      // Usa a variável correta dependendo da plataforma
                                      : "Vídeo selecionado: ${kIsWeb ? _selectedVideoName : _selectedVideoFile!.path.split('/').last}",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFF79757F),
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                                    videoFile: _selectedVideoFile,
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
  }
  Future<void> _pickVideo() async {
    setState(() {
      _loadigFile = true;
    });
    try {
      XFile? file;

      if (kIsWeb) {
        const XTypeGroup videoTypeGroup = XTypeGroup(
          label: 'videos',
          extensions: <String>['mp4', 'webm'],
          mimeTypes: <String>['video/mp4', 'video/webm'],
        );

        file = await openFile(acceptedTypeGroups: [videoTypeGroup]);
      } else {

        final ImagePicker picker = ImagePicker();
        file = await picker.pickVideo(source: ImageSource.gallery);
      }

      if (file == null) return;

      bool isValid = await _validateVideo(file);

      if (!isValid) return;

      if (kIsWeb) {
        final bytes = await file.readAsBytes();
        setState(() {
          _selectedVideoBytes = bytes;
          _selectedVideoName = file!.name;
          _selectedVideoFile = file;
        });
      } else {
        setState(() {
          _selectedVideoFile = file;
          _selectedVideoBytes = null; // Garante que bytes antigos sejam limpos
          _selectedVideoName = file!.name;
        });

        print("Vídeo selecionado no mobile (Path): ${file.path}");
      }

    } catch (e, stack) {
      print("Erro ao selecionar arquivo de vídeo: $e");
      debugPrintStack(stackTrace: stack);
    }finally{
      setState(() {
        _loadigFile = false;
      });
    }
  }

  Future<bool> _validateVideo(XFile file) async {
    final int fileSizeInBytes = await file.length();
    final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    if (fileSizeInMB > 50) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('O arquivo excede o limite de 50MB (${fileSizeInMB.toStringAsFixed(2)}MB).'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return false;
    }


    return true;
  }
}
