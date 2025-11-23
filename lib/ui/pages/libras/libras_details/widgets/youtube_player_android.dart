import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LibrasVideoPlayerAndroid extends StatefulWidget {
  final String videoUrl;

  const LibrasVideoPlayerAndroid({super.key, required this.videoUrl});

  @override
  State<LibrasVideoPlayerAndroid> createState() => _LibrasVideoPlayerAndroidState();
}

class _LibrasVideoPlayerAndroidState extends State<LibrasVideoPlayerAndroid> {
  late YoutubePlayerController _controller;


  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,

      ),
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // REMOVI O YoutubePlayerBuilder
    // Usamos o player diretamente com um Container para limitar o tamanho
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Theme.of(context).colorScheme.primary,
          progressColors: ProgressBarColors(
            playedColor: Theme.of(context).colorScheme.primary,
            handleColor: Theme.of(context).colorScheme.primary,
          ),
          bottomActions: [
            const CurrentPosition(),
            const SizedBox(width: 10),
             ProgressBar(
              isExpanded: true, // Faz a barra de progresso ocupar o espaço todo
              colors: ProgressBarColors(
                playedColor: Theme.of(context).colorScheme.primary,
                handleColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            const SizedBox(width: 10),
            const RemainingDuration(),
            // const FullScreenButton(), // <--- REMOVIDO DA LISTA
          ],
          onReady: () {
            // Opcional: Ações quando o player estiver pronto
          },
        ),
      ],
    );
  }
}
