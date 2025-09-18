import 'package:flutter/cupertino.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

class ModalMidiaPageLibras extends StatelessWidget {
  final String titulo;
  final String urlVideo;
  final String description;
  final DateTime timestamp;
  final List<String> relacionados;

  const ModalMidiaPageLibras({
    super.key,
    required this.titulo,
    required this.timestamp,
    required this.description,
    required this.relacionados,
    required this.urlVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopContentLibras(),
      ],
    );
  }
}
