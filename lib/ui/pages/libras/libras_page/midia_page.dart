
import 'package:flutter/material.dart';
import 'package:if_inclusivo/domain/models/api/response/gen_responses.dart';
import 'package:if_inclusivo/routing/app_router.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/view_models/libras_view_model.dart';
import 'package:if_inclusivo/ui/pages/libras/specific_topic/widgets/midia_card_info.dart';
import 'package:if_inclusivo/utils/text_formater.dart';
import 'package:result_command/src/command.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:if_inclusivo/ui/core/layout/custom_container_shell.dart';
import 'package:if_inclusivo/ui/pages/libras/libras_page/widgets/top_content_libras.dart';

class MidiaPageLibras extends StatefulWidget {
  final LibrasViewModel viewModel;
  const MidiaPageLibras({
    super.key,
    required this.viewModel,

  });

  @override
  State<MidiaPageLibras> createState() => _MidiaPageLibrasState();
}

class _MidiaPageLibrasState extends State<MidiaPageLibras> {
  YoutubePlayerController? _controller;
  late final String? videoId;
  late final LibrasResponseModel model;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainerShell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: ListenableBuilder(
          listenable: widget.viewModel.fetchLibrasCmd,
          builder: (context,_) {
            final status = widget.viewModel.fetchLibrasCmd.value;

            switch (status){

              case RunningCommand<LibrasResponseModel>():
                return Center(child: CircularProgressIndicator(),);
              case FailureCommand<LibrasResponseModel>(:final error):
                return Center(
                  child: Text(
                    'Erro ao carregar o vídeo: $error',
                    style: const TextStyle(color: Colors.red),
                  ),
                );

              case SuccessCommand<LibrasResponseModel>(:final value):
                if(!initialized){
                  videoId = YoutubePlayerController.convertUrlToId(value.url);

                  _controller = YoutubePlayerController.fromVideoId(
                    videoId: videoId!,
                    autoPlay: false,
                    params: const YoutubePlayerParams(
                      mute: true,
                      showControls: true,
                      showFullscreenButton: true,
                    ),
                  );
                  initialized = true;
                  model = value;
                }

                return Column(
                  children: [
                    TopContentLibras(),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 900) {
                          return _buildNarrowLayout();
                        } else {
                          return _buildWideLayout(context);
                        }
                      },
                    ),
                  ],
                );
              default: return SizedBox.shrink();
            }


          }
        ),
      ),
    );
  }

  Widget _buildMidiaContent(BuildContext context) {
    String palavra = formatarTexto(model.palavra);

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
          DateTime.now().timeZoneName,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: 16),
        MidiaCardInfo(
          maxWidth: 635,
          textAlign: TextAlign.left,
          title: 'Descrição',
          label: model.descricao,
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
          if(widget.viewModel.loading)
            CircularProgressIndicator(),
          if(!widget.viewModel.loading && widget.viewModel.relacionados.isEmpty )
            Text('Não foi possível carregar...'),
          ...widget.viewModel.relacionados.map((toElement)=> _buildRelatedLinkItem(toElement.palavra, toElement.id))
        ],
      ),
    );
  }

  Widget _buildRelatedLinkItem(String title, int id) {
    String palavra = formatarTexto(title);

    return   Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => MidiaRouter(id).push(context),
        hoverColor: const Color.fromRGBO(230, 170, 252, 0.7019607843137254), // hover suave

        child: Ink(
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

  Widget _buildNarrowLayout() {
    return Column(
      children: [
        _buildMidiaContent(context),
        const SizedBox(height: 24),
        _buildRelatedCard(context),
      ],
    );
  }
}
