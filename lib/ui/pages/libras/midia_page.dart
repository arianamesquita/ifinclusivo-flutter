import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/widgets/midia_card_info.dart';
import 'package:if_inclusivo/utils/text_formater.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/pages/libras/widgets/top_content_libras.dart';

class MidiaPageLibras extends StatefulWidget {
  final String titulo;
  final String urlVideo;
  final String timestamp;
  final List<String> relacionados;
  final String description;

  const MidiaPageLibras({
    super.key,
    required this.titulo,
    required this.timestamp,
    required this.relacionados,
    required this.urlVideo,
    required this.description,
  });

  @override
  State<MidiaPageLibras> createState() => _MidiaPageLibrasState();
}

class _MidiaPageLibrasState extends State<MidiaPageLibras> {
  YoutubePlayerController? _controller;
  late final String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayerController.convertUrlToId(widget.urlVideo);

    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: true,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

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
                  return _buildNarrowLayout(context);
                } else {
                  return _buildWideLayout(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMidiaContent(BuildContext context) {
    String palavra = formatarTexto(widget.titulo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: MouseRegion(
            onEnter: (_) => _controller!.playVideo(),
            onExit: (_) => _controller!.pauseVideo(),
            child: YoutubePlayer(
              controller: _controller!,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          palavra,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 14),
        Text(
          widget.timestamp,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 16),
        MidiaCardInfo(
          maxWidth: 635,
          textAlign: TextAlign.left,
          title: 'Descrição',
          label: widget.description,
          titleStyle: Theme.of(context).textTheme.titleMedium,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildRelatedCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(172, 130, 186, 1),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              'Relacionados',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          ...widget.relacionados.map((item) => _buildRelatedLinkItem(item)),
        ],
      ),
    );
  }

  Widget _buildRelatedLinkItem(String title) {
    String palavra = formatarTexto(title);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(172, 130, 186, 1),
        border: Border(top: BorderSide(color: Colors.white, width: 2.5)),
      ),
      child: Text(
        palavra,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _buildMidiaContent(context)),
        const SizedBox(width: 92),
        Expanded(flex: 1, child: _buildRelatedCard(context)),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildMidiaContent(context),
        const SizedBox(height: 24),
        _buildRelatedCard(context),
      ],
    );
  }
}
