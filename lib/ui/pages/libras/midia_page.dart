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
    this.urlVideo = "assets/player.png",
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          children: [
            TopContentLibras(),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 900) {
                  // Se a tela for menor que 900px, usa o layout vertical
                  return _buildNarrowLayout(context);
                } else {
                  // Se for maior ou igual a 900px, usa o layout lado a lado
                  return _buildWideLayout(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(urlVideo, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        Text(
          titulo,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 14),
        Text(
          timestamp,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 16),
        CardInfo(
          textAlign: TextAlign.left,
          title: 'Descrição',
          label: description,
          titleStyle: Theme.of(context).textTheme.titleMedium,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 50,),
      ],
    );
  }

  Widget _buildRelatedCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(172,130,186, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Relacionados',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
          ...relacionados.map((item) => _buildRelatedLinkItem(item)),
        ],
      ),
    );
  }

  Widget _buildRelatedLinkItem(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(172,130,186, 1),
        border: Border(top: BorderSide(color: Colors.white, width: 2.5)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _buildVideoContent(context),
        ),
        const SizedBox(width: 92),
        Expanded(
          flex: 1,
          child: _buildRelatedCard(context),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildVideoContent(context),
        const SizedBox(height: 24),
        _buildRelatedCard(context),
      ],
    );
  }
}