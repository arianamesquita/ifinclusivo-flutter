import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/core/widgets/card_info.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

class ModalMidiaPageLibras extends StatelessWidget {
  final String titulo;
  final String urlVideo;
  final String timestamp;
  final List<String> relacionados;
  final String description;

  const ModalMidiaPageLibras({
    super.key,
    required this.titulo,
    required this.timestamp,
    required this.relacionados,
    this.urlVideo = 'assets/video.png',
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerShell(
      child: Column(
        children: [
          TopContentLibras(),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(urlVideo, fit: BoxFit.cover),
                  SizedBox(height: 16,),
                  Text(titulo, style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 14,),
                  Text(
                    timestamp,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,),
                  ),
                  SizedBox(height: 16,),
                  CardInfo(
                    title: 'Descrição',
                    label: description,
                    maxWidth: 635,
                  ),
                  SizedBox(height: 140,),
                ],
              ),
              Column(children: [Text('Relacionados')]),
            ],
          ),
        ],
      ),
    );
  }
}
