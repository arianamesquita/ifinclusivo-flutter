import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/libras_custom_text_field.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';

import '../../core/layout/custom_container_shell.dart';

class WordSuggestionPage extends StatefulWidget {
  const WordSuggestionPage({super.key});

  @override
  State<WordSuggestionPage> createState() => _WordSuggestionPageState();
}

class _WordSuggestionPageState extends State<WordSuggestionPage> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _reasonController = TextEditingController();
  final _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomContainerShell(
      child: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TopContentLibras(
                  title: "CONVERTE LIBRAS",
                ),
              ),
              Text(
                "Sugerir uma nova palavra",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Sua contribuição ajuda a nossa comunidade a crescer!\nPreencha os campos abaixo para nos enviar sua sugestão.",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Palavra ou termo",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 7),
                    LibrasCustomTextField(
                        label: "Ex: Inteligência Artificial, JavaScript, API",
                        controller: _wordController,
                        validator: (v) => v == null || v.isEmpty ? "Por favor, insira uma palavra ou termo." : null,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Porque esta palavra é importante?",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 7),
                    LibrasCustomTextField(
                      label: "Ex: É um termo muito comum na área de desenvolvimento e ainda não possui um sinal conhecido.",
                      controller: _reasonController,
                      validator: (v) => v == null || v.isEmpty ? "Explique porque esta palavra é importante." : null,
                    ),
                    const SizedBox(height: 30),
                    Row(
                    children: [
                      Icon(Icons.play_circle, color: Color(0xFFA60F13)),
                      const SizedBox(width: 7),
                      Text(
                        "Link de vídeo do Youtube (opcional)",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                      "Se você conhece um vídeo que demonstre o sinal, nos ajude colando o link.",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF79757F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    LibrasCustomTextField(
                      label: "Cole o link do vídeo aqui",
                      controller: _linkController,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.videocam_outlined, color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(width: 6),
                        Text(
                          "Vídeo do sinal (opcional)",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 22),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Botão de vídeo pressionado!")),
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
                        const SizedBox(width: 20),
                        Text(
                          "Formatos aceitos: mp4, WebM\nDuração máxima: 2 minutos",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF79757F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Sugestão enviada com sucesso!'),
                                ),
                              );
                              // Aqui você pode adicionar a lógica para enviar os dados
                              print("Palavra: ${_wordController.text}");
                              print("Motivo: ${_reasonController.text}");
                              print("Link: ${_linkController.text}");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2B7A62),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Sugerir palavra",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
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
}
